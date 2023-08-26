
echo off

set FOLDER=%~dp0
cd  %FOLDER%

rem reg delete HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /f /v WUServer
rem reg delete HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /f /v WUStatusServer

reg delete HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /f > nul 2> nul

net stop wuauserv
net start wuauserv

reg query HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate > nul 2> nul
if %ERRORLEVEL% NEQ 0 (echo OK: Registry-Key deleted! & echo.) else (echo ERROR: Registry-Key not deleted! & echo.)

pause

C:\Windows\explorer.exe ms-settings:windowsupdate
