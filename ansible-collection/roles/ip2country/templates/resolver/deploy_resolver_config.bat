set folder=D:\apps\resolver
set folder2=d:\apps\resolver2

@For /f "tokens=2-4 delims=/ " %%a in ('date /t') do (set date_log=%%c%%a%%b)

unzip -o %2  -d %folder%\
unzip -o %2  -d %folder2%\

if errorlevel 1 (
echo The Unzip didn't worked properly ! > d:\apps\resolver\logs\script_result.%date_log%
exit 1
)

IF NOT EXIST %folder%\resolver.inc (
echo The file d:\apps\resolver\resolver.inc doesn't exist  ! >> d:\resolver\logs\script_result.%date_log%
exit 1
)

pyrgeoiprereadsmem.exe geoipreread_ip2country_res.ini >> d:\resolver\logs\script_result.%date_log%
pyrgeoiprereadsmem.exe geoipreread_ip2country_res_2.ini >> d:\resolver\logs\script_result2.%date_log%

@rem and delete processed file
@rem del %2






