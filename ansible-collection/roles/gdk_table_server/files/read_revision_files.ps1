$host.UI.RawUI.BufferSize = new-object System.Management.Automation.Host.Size(1024,50)
$ErrorActionPreference = "Stop"

try {
    $files = Get-ChildItem -Path "D:\apps\bin\c_gdk\javagames\vendors\*\GDK_*\revision.txt" -ErrorAction Stop

    $result = @()
    foreach ($file in $files) {
        $content = Get-Content -Path $file -ErrorAction Stop

        $gameNameMatch = $content | Select-String -Pattern '^gameName:\s*(.*)'
        $dateMatch = $content | Select-String -Pattern '^date:\s*(.*)'
        $buildKeyMatch = $content | Select-String -Pattern '^buildKey:\s*(.*)'
        $buildNumberMatch = $content | Select-String -Pattern '^buildNumber:\s*(.*)'
        $revisionMatch = $content | Select-String -Pattern '^revision:\s*(.*)'
        $gameTypeMatch = $content | Select-String -Pattern '^gameType:\s*(.*)'
        $variantTypeMatch = $content | Select-String -Pattern '^variantType:\s*(.*)'
        $engineVersionMatch = $content | Select-String -Pattern '^variantType:\s*(.*)'
        $frameworkVersionMatch = $content | Select-String -Pattern '^variantType:\s*(.*)'

        $gameName = if ($gameNameMatch) { $gameNameMatch.Matches[0].Groups[1].Value.Trim() } else { "" }
        $date = if ($dateMatch) { $dateMatch.Matches[0].Groups[1].Value.Trim() } else { "" }
        $buildKey = if ($buildKeyMatch) { $buildKeyMatch.Matches[0].Groups[1].Value.Trim() } else { "" }
        $buildNumber = if ($buildNumberMatch) { $buildNumberMatch.Matches[0].Groups[1].Value.Trim() } else { "" }
        $revision = if ($revisionMatch) { $revisionMatch.Matches[0].Groups[1].Value.Trim() } else { "" }
        $gameType = if ($gameTypeMatch) { $gameTypeMatch.Matches[0].Groups[1].Value.Trim() } else { "" }
        $variantType = if ($variantTypeMatch) { $variantTypeMatch.Matches[0].Groups[1].Value.Trim() } else { "" }
        $engineVersion = if ($engineVersionMatch) { $engineVersionMatch.Matches[0].Groups[1].Value.Trim() } else { "" }
        $frameworkVersion = if ($frameworkVersionMatch) { $frameworkVersionMatch.Matches[0].Groups[1].Value.Trim() } else { "" }

        $data = @{
            "gameName" = $gameName
            "date" = $date
            "buildKey" = $buildKey
            "buildNumber" = $buildNumber
            "revision" = $revision
            "gameType" = $gameType
            "variantType" = $variantType
            "engineVersion" = $engineVersion
            "frameworkVersion" = $frameworkVersion
            "filePath" = $file.FullName
            "ansible" = 1
        }

        $result += $data
    }

    $result | ConvertTo-Json -Compress
}
catch {
    Write-Error "An error occurred: $_"
}
