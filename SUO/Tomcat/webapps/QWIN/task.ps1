Clear-Host
$path = split-path -parent $MyInvocation.MyCommand.Definition
$servers = get-content $path"\servers.txt";

foreach ($server in $servers)
    {
    	#$service = (get-service -ComputerName $server -Name QWin_Srv)
    	#$service.Stop()
    	#timeout -t 10
    	Robocopy.exe $path"\QWIN\" "\\$server\C$\c$\ProgramData\Q-MATIC\QWIN S\Tomcat\webapps" /R:1 /W:1 /IT /E
    	#$service.Start()
    }
