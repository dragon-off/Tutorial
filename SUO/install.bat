cd "C:\ProgramData\Q-MATIC\QWIN S\Tomcat\webapps\QWIN\ca\smsuo_v2"
nssm.exe install Tester Tester.exe
copy "C:\ProgramData\Q-MATIC\QWIN S\starter_orig.bat" "C:\ProgramData\Q-MATIC\QWIN S\starter.bat" /Y
shutdown -r -t 30