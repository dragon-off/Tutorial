REM VER.5 2014
timeout -t 60
cd "C:\ProgramData\Q-MATIC\QWIN S\Tomcat\webapps\QWIN\ca\smsuo_v2"
netsh interface set interface name="lan_sbrf" admin=ENABLE
net stop QWin_Srv
TASKKILL /IM qwin32.exe /F
net start Tester
timeout -t 20
net start QWin_Srv
timeout -t 70
wmic process where name="qwin32.exe" CALL setpriority 128
cd "C:\ProgramData\Q-MATIC\QWIN S\MRetReport"
start RetReport.exe
cd "C:\ProgramData\Q-MATIC\qwin s\SC"
start SchedulerStarter.exe
cd "C:\ProgramData\Q-MATIC\QWIN S\QPrognoz"
start QPrognoz.exe
wmic process where name="QPrognoz.exe" CALL setpriority 64