@setlocal enableextensions enabledelayedexpansion
@echo off
cd C:\ProgramData\Q-MATIC\QWIN S\Tomcat\webapps\QWIN\ca
REM VER.5.9.9
REM путь к архиватору
Set Path7zip="C:\ProgramData\Q-MATIC\QWIN S\7zip\7z.exe"
REM путь к папке с архивами для обновления 
Set SrsFolder="C:\ProgramData\Q-MATIC\QWIN S\Tomcat\webapps\QWIN\ca\update"
Set SrsFolderMP="C:\ProgramData\Q-MATIC\QWIN S\Tomcat\webapps\QWIN\ca\updatemp"
REM путь распаковки архива(архив содержит оталкиваясь от папки Q-matic)
Set OutFolder="C:\ProgramData\Q-MATIC\QWIN S"
Set OutFolderMP="C:\Program Files\Q-MATIC\Q-MATIC Management Portal"
REM путь к папке с архивами для обновления 
Set BackupFolder="C:\ProgramData\Q-MATIC\backup_SUO"
REM путь распаковки архива(архив содержит оталкиваясь от папки Q-matic)
Set SourceFolder="C:\ProgramData\Q-MATIC\QWIN S"

set file="%1"
REM проверяем тип обновления
if "%1" == ""  (
	echo "Файл не задан"	
		
		del %BackupFolder%"\every_day_backup.zip"
		%Path7zip% a %BackupFolder%"\every_day_backup.zip" %SourceFolder%"\"
		cd C:\ProgramData\Q-MATIC\QWIN S
		del "C:\ProgramData\Q-MATIC\QWIN S\login.action@username=Administrator" /Q
		wget --save-cookies cookies.txt --keep-session-cookies --post-data="username=Administrator&localeStr=en_UK&sessionID=000000" http://127.0.0.1/login/login.action?username=Administrator
		timeout /t 20
		wget --load-cookies cookies.txt http://127.0.0.1/ca/update/set_suo_to_db.jsp
		wget --load-cookies cookies.txt http://127.0.0.1/ca/update/db_optim.jsp
		wget --load-cookies cookies.txt http://127.0.0.1/ca/day_pic.jsp
		wget --load-cookies cookies.txt http://127.0.0.1/login/update_login.jsp?username=
		del "C:\ProgramData\Q-MATIC\QWIN S\set_suo_to_db.jsp" /Q
		del "C:\ProgramData\Q-MATIC\QWIN S\db_optim.jsp" /Q
		TASKKILL /IM SberDisplay.exe /F
		TASKKILL /IM RetReport.exe /F
		TASKKILL /IM Tester.exe /F
		del "C:\ProgramData\Q-MATIC\QWIN S\login.action@username=Administrator" /Q
		shutdown -r -t 90
) ELSE (
	
	if  not x%file:qsp=%==x%file% (
		echo "Выполнение обновлений через qsp"	
		REM ======================================================================================================================
		
		cd C:\ProgramData\Q-MATIC\QWIN S
		del "C:\ProgramData\Q-MATIC\QWIN S\login.action@username=Administrator" /Q
		wget --save-cookies cookies.txt --keep-session-cookies --post-data="username=Administrator&localeStr=en_UK&sessionID=000000" http://127.0.0.1/login/login.action?username=Administrator
		wget --load-cookies cookies.txt http://127.0.0.1/ca/update/run_qsp.jsp?file=%file%
		wget --load-cookies cookies.txt http://127.0.0.1/ca/update/run_qsp.jsp
		del "C:\ProgramData\Q-MATIC\QWIN S\run_qsp.jsp@file=msqms_qsys_script.qsp" /Q
		del "C:\ProgramData\Q-MATIC\QWIN S\run_qsp.jsp /Q
		del "C:\ProgramData\Q-MATIC\QWIN S\Tomcat\webapps\QWIN\ca\update\msqms_qsys_script.qsp" /Q
		timeout /t 20
		wget --load-cookies cookies.txt http://127.0.0.1/ca/update/set_suo_to_db.jsp
		del "C:\ProgramData\Q-MATIC\QWIN S\set_suo_to_db.jsp" /Q
		
		copy "C:\ProgramData\Q-MATIC\QWIN S\Tomcat\webapps\QWIN\ca\update\cardlist.qsp" "C:\ProgramData\Q-MATIC\QWIN S\Tomcat\webapps\QWIN\touchscreens\super\cardlist.qsp" /Y
		cd C:\ProgramData\Q-MATIC\QWIN S\Tomcat\webapps\QWIN\ca\update
		del "%file%" /Q
		del "cardlist.qsp" /Q
		del "C:\ProgramData\Q-MATIC\QWIN S\login.action@username=Administrator" /Q
		
		
	) ELSE if  not x%file:zip=%==x%file% ( 
	REM ====================================================================================================================
		echo "Выполнение обновлений через zip"	
		net stop QWin_Srv
		TASKKILL /IM SberDisplay.exe /F
		TASKKILL /IM RetReport.exe /F
		TASKKILL /IM Tester.exe /F
		REM распаковка архива
		del %BackupFolder%"\no_install_pack.zip"
		%Path7zip% a %BackupFolder%"\no_install_pack.zip" %SourceFolder%"\"
		cd C:\ProgramData\Q-MATIC\QWIN S\Tomcat\webapps\QWIN\ca\update
		%Path7zip% x "%file%" -o%OutFolder% -aoa 
		del "%file%"  /Q
		del %BackupFolder%"\install_pack.zip"
		%Path7zip% a %BackupFolder%"\install_pack.zip" %SourceFolder%"\"
		shutdown -r -t 30
	)
	REM end zip update
)
endlocal
