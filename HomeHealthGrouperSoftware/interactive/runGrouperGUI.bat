@echo off

ECHO.
ECHO.***************************************************
ECHO.* Home Health Grouper GS (Grouper Software)       *
ECHO.* Center for Medicare and Medicaid Services (CMS) *
ECHO.* === HH Interactive tool ===                     *
ECHO.***************************************************
ECHO.

for /f "tokens=3" %%G in ('java -version 2^>^&1 ^| findstr /i "version"') do (
    set "JAVA_VERSION=%%~G"
)

for /f "delims=." %%a in ("%JAVA_VERSION%") do set "MAJOR_VERSION=%%a"

if %MAJOR_VERSION% GEQ 17 (
    GOTO found
) else (
    GOTO error
)

:found
ECHO.Java %MAJOR_VERSION% detected
java -Xms256m -Xmx512m -jar ./HomeHealthGUI.jar
GOTO end

:error
ECHO.ERROR: No suitable Java version (17 or higher) was found. The program will end now.
@pause

:end
@echo on