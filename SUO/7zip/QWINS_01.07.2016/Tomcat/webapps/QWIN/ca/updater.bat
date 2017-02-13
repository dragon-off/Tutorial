REM VER.2.0
REM распаковка архива
REM путь к архиватору
Set Path7zip="C:\ProgramData\Q-MATIC\QWIN S\7zip\7z.exe"
REM путь к папке с архивами для обновления 
Set SrsFolder="C:\ProgramData\Q-MATIC\QWIN S\Tomcat\webapps\QWIN\ca\update"
Set SrsFolderMP="C:\ProgramData\Q-MATIC\QWIN S\Tomcat\webapps\QWIN\ca\updatemp"
REM путь распаковки архива(архив содержит оталкиваясь от папки Q-matic)
Set OutFolder="C:\ProgramData\Q-MATIC\QWIN S"
Set OutFolderMP="C:\Program Files\Q-MATIC\Q-MATIC Management Portal"
REM путь к папке с архивами для обновления 
Set BackupFolder="C:\ProgramData\Q-MATIC\QWIN S\Tomcat\webapps\QWIN\ca\backup"
REM путь распаковки архива(архив содержит оталкиваясь от папки Q-matic)
Set SourceFolder="C:\ProgramData\Q-MATIC\QWIN S"

REM DEL удалить пред идующий архив до обновления
REM вариант для полного бейкапа 7z.exe a "%BackupFolder%"\full_"%DATE%".zip "%SourceFolder%"\
del %BackupFolder%"\full_old.zip"
del %BackupFolder%"\qsys_old.zip"
REM DEL удалить пред идующий архив после обновления
REM вариант для полного бейкапа 7z.exe a "%BackupFolder%"\full_"%DATE%".zip "%SourceFolder%"\
del %BackupFolder%"\full_posle.zip"
del %BackupFolder%"\qsys_posle.zip"
%Path7zip% a %BackupFolder%"\full_old.zip" %SourceFolder%"\"
REM пакуем ВСЕ (полный бейкап)
%Path7zip% a %BackupFolder%"\qsys_old.zip" %SourceFolder%"\qsys.ini"
REM пакуем ВСЕ (полный бейкап)
%Path7zip% a "C:\ProgramData\Q-MATIC\QWIN S\Tomcat\webapps\QWIN\ca\QSYS.zip" %SourceFolder%"\qsys.ini"


For /R %SrsFolder% %%I In (*.zip) Do %Path7zip% x "%%I" -o%OutFolder% -aoa >Nul
For /R %SrsFolderMP% %%I In (*.zip) Do %Path7zip% x "%%I" -o%OutFolderMP% -aoa >Nul
For /R %SrsFolder% %%I In (*.zip) Do del "%%I"
For /R %SrsFolderMP% %%I In (*.zip) Do del "%%I"


REM распаковка архива
REM путь к архиватору


REM пакуем то что нужно
REM пакуем ВСЕ (полный бейкап)



%Path7zip% a %BackupFolder%"\full_posle.zip" %SourceFolder%
REM пакуем ВСЕ (полный бейкап)
%Path7zip% a %BackupFolder%"\qsys_posle.zip" %SourceFolder%"\qsys.ini"
