# Define variables
$bucketName = "{{ ggn_application_logs_bucket }}"
$handlePath = "handle.exe"
$localDirectory = "D:\apps\logs\"
$herculesLogDirectory = "D:\apps\configs\c_monitormain\Hercules.log\"
$hostname = (Get-WmiObject Win32_Computersystem).Name
$s3BucketPath = "$hostname"

# Function to check if a file is in use with handle.exe
function IsFileInUse($filePath) {
    $result = & $handlePath $filePath 2>&1 | Select-String -Pattern "no matching handles found"
    return -not $result
}

# Function to check if a file is in use with System.IO
function Check-FileOpen {
    param (
        [parameter(Mandatory=$true)]
        [string]$Path
    )
    try {
        $oFile = Get-Item $Path
        $oStream = $oFile.Open([System.IO.FileMode]::Open, [System.IO.FileAccess]::ReadWrite, [System.IO.FileShare]::None)
        $oStream.Close()
        $false
    } catch {
        # File is locked by a process.
        $true
    }
}

# Function to upload a file to S3
function UploadToS3($filePath) {
    $s3Key = $filePath -replace [regex]::Escape($localDirectory), '' -replace [regex]::Escape($herculesLogDirectory), 'Hercules.log\'
    $s3Key = $s3Key -replace '\\', '/'
    $s3Path = "s3://$bucketName/$s3BucketPath/$s3Key"
    aws s3 mv $filePath $s3Path
}

# Function to process files in a directory
function ProcessFiles($directory) {
    $files = Get-ChildItem -File -Path $directory -Recurse
    foreach ($file in $files) {
        if (Check-FileOpen $file.FullName) {
            Write-Host "Skipping $($file.FullName) - File is in use."
        } else {
            # Upload the file to S3
            UploadToS3 $file.FullName
        }
    }
}

# Function to process files in a directory
function ProcessFilesMonior($directory) {
    # Get the date of the previous day
    $previousDay = (Get-Date).AddDays(-1).ToString("yyyyMMdd")
    
    # Create the full path to the folder for the previous day
    $previousDayFolder = Join-Path -Path $directory -ChildPath $previousDay
    
    # Check if the folder for the previous day exists
    if (Test-Path -Path $previousDayFolder -PathType Container) {
        # Create the name of the zip file
        $zipFileName = "$previousDay.zip"

        # Zip the folder from the previous day
        Compress-Archive -Path $previousDayFolder -DestinationPath $zipFileName

        # Upload the zip file to S3
        UploadToS3 $zipFileName

        # Remove the folder from the previous day
        Remove-Item -Path $previousDayFolder -Recurse -Force
    } else {
        Write-Host "Folder for previous day does not exist: $previousDayFolder"
    }
}

# Get all files in the local directory and upload them to S3
$localFiles = Get-ChildItem -File -Path $localDirectory -Recurse

# Stop promtail to free old logs
Stop-Service -Name promtail

ProcessFiles $localDirectory

# Start promtail again
Start-Service -Name promtail

{% if ('role_casino_zone0_monitor' in group_names) or ('role_ggn_hercules' in group_names) %}
ProcessFilesMonior $herculesLogDirectory
{% endif %}
