@echo off
REM Update varaible installerDir
SET installerDir=%SystemDrive%\AgentInstaller_15.8.x
SET logFile=%SystemDrive%\installAgent.log
SET "versionDLP="

FOR /f "tokens=4-5 delims=. " %%i IN ('ver') DO (SET versionOS=%%i.%%j)
IF NOT "%versionOS%" == "10.0" (echo Unsupported operating system > %logFile%) ELSE (call :checkversion)
GOTO :eof

:checkversion
FOR /f "tokens=2-5 delims=. " %%i IN ('%installerDir%\AgentCleanup.exe ^| find "ProductVersion:"') DO (SET versionDLP=%%i.%%j.%%k.%%l)
IF DEFINED versionDLP (call :uninstall) ELSE (call :checkstate)
GOTO :eof

:uninstall
REM Add GUID and password
start /wait msiexec /uninstall {} /q UNINSTALLPASSWORD=""

:checkstate
SET count=1
FOR /f "tokens=*" %%I IN ('%installerDir%\AgentCleanup.exe') DO (set /a count+=1)
IF NOT %count%==1 (echo Symantec DLP agent inconsistent > %logFile%) ELSE (call :install)
GOTO :eof

:install
REM Add install script here
GOTO :eof
