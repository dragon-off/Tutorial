REM VER.2.0
REM ���������� ������
REM ���� � ����������
Set Path7zip="C:\ProgramData\Q-MATIC\QWIN S\7zip\7z.exe"
REM ���� � ����� � �������� ��� ���������� 
Set SrsFolder="C:\ProgramData\Q-MATIC\QWIN S\Tomcat\webapps\QWIN\ca\update"
Set SrsFolderMP="C:\ProgramData\Q-MATIC\QWIN S\Tomcat\webapps\QWIN\ca\updatemp"
REM ���� ���������� ������(����� �������� ����������� �� ����� Q-matic)
Set OutFolder="C:\ProgramData\Q-MATIC\QWIN S"
Set OutFolderMP="C:\Program Files\Q-MATIC\Q-MATIC Management Portal"
REM ���� � ����� � �������� ��� ���������� 
Set BackupFolder="C:\ProgramData\Q-MATIC\QWIN S\Tomcat\webapps\QWIN\ca\backup"
REM ���� ���������� ������(����� �������� ����������� �� ����� Q-matic)
Set SourceFolder="C:\ProgramData\Q-MATIC\QWIN S"

REM DEL ������� ���� ������� ����� �� ����������
REM ������� ��� ������� ������� 7z.exe a "%BackupFolder%"\full_"%DATE%".zip "%SourceFolder%"\
del %BackupFolder%"\full_old.zip"
del %BackupFolder%"\qsys_old.zip"
REM DEL ������� ���� ������� ����� ����� ����������
REM ������� ��� ������� ������� 7z.exe a "%BackupFolder%"\full_"%DATE%".zip "%SourceFolder%"\
del %BackupFolder%"\full_posle.zip"
del %BackupFolder%"\qsys_posle.zip"
%Path7zip% a %BackupFolder%"\full_old.zip" %SourceFolder%"\"
REM ������ ��� (������ ������)
%Path7zip% a %BackupFolder%"\qsys_old.zip" %SourceFolder%"\qsys.ini"
REM ������ ��� (������ ������)
%Path7zip% a "C:\ProgramData\Q-MATIC\QWIN S\Tomcat\webapps\QWIN\ca\QSYS.zip" %SourceFolder%"\qsys.ini"


For /R %SrsFolder% %%I In (*.zip) Do %Path7zip% x "%%I" -o%OutFolder% -aoa >Nul
For /R %SrsFolderMP% %%I In (*.zip) Do %Path7zip% x "%%I" -o%OutFolderMP% -aoa >Nul
For /R %SrsFolder% %%I In (*.zip) Do del "%%I"
For /R %SrsFolderMP% %%I In (*.zip) Do del "%%I"


REM ���������� ������
REM ���� � ����������


REM ������ �� ��� �����
REM ������ ��� (������ ������)



%Path7zip% a %BackupFolder%"\full_posle.zip" %SourceFolder%
REM ������ ��� (������ ������)
%Path7zip% a %BackupFolder%"\qsys_posle.zip" %SourceFolder%"\qsys.ini"
