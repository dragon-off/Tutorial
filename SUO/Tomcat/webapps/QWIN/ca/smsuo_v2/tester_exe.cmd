@echo off
timeout /t 600
set application=tester.exe
:BEGIN
tasklist | find /I "%application%" >nul
if errorlevel 1 (
  start "" /b "%ProgramData%\Q-MATIC\QWIN S\tomcat\webapps\QWIN\ca\smsuo_v2\Tester.exe"
goto end
) else (
  echo %application% is running
)
:END
rem ∆дЄм 10 секунд между проверками
timeout /t 10
goto BEGIN