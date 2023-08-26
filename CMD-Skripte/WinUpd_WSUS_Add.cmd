
echo off

set FOLDER=%~dp0
cd  %FOLDER%

rem reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /f /v WUServer /t Reg_Sz /d "http://eewmgm03.eew-group.local:8530"
rem reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate /f /v WUStatusServer /t Reg_Sz /d "http://eewmgm03.eew-group.local:8530"

gpupdate /force

net stop wuauserv
net start wuauserv

reg query HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate > nul 2> nul
if %ERRORLEVEL% EQU 0 (echo OK: Registry-Key created! & echo.) else (echo ERROR: Registry-Key not created! & echo.)

pause
