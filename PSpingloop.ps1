<#Powershell Ping list
--This simple script pings a list of servers--
#>

$name = [Environment]::Username
$servers = "c:\users\$name\desktop\servers.txt"


foreach ($s in $servers)
	{
	ping -n 1 $s where
	}

