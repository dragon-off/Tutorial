@echo OFF

rem --------------------------------------------------
rem If JAVA_HOME is not set globally, edit the line
rem below to match your java root folder:
rem 
rem SET JAVA_HOME=C:\Program Files\Java\jdk1.5.0_0x
rem --------------------------------------------------

if "%JAVA_HOME%" == "" GOTO javanotfound

SET N2A="%JAVA_HOME%\bin\native2ascii.exe"
SET BACKUPFILE=QWinLanguageBundle_en_UK_backup_before_unicode.lan
rem --------------------------------------------------

if not exist %N2A% GOTO native2asciinotfound

rem --------------------------------------------------
if exist %BACKUPFILE% del %BACKUPFILE%
ren QWinLanguageBundle_en_UK.lan %BACKUPFILE%
%N2A% %BACKUPFILE% QWinLanguageBundle_en_UK.lan
rem --------------------------------------------------

echo.
echo.
echo Conversion successful!
echo.
echo Original file renamed to:
echo %BACKUPFILE%
echo.
echo.
pause
GOTO end

rem --------------------------------------------------
:native2asciinotfound
rem --------------------------------------------------
echo.
echo.
echo %N2A% is missing, conversion not successful!
echo.
echo.
pause
GOTO end
rem --------------------------------------------------

rem --------------------------------------------------
:javanotfound
rem --------------------------------------------------
echo.
echo.
echo JAVA_HOME environment variable is not set!
echo.
echo Please set JAVA_HOME to point to your
echo java root folder.
echo.
echo Edit line 7 in this batch file
echo.
echo or
echo.
echo Add JAVA_HOME as a global environment variable
echo.
echo.
pause
GOTO end
rem --------------------------------------------------

rem --------------------------------------------------
:end
rem --------------------------------------------------

