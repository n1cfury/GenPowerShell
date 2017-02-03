<#Powershell Ping list
--This simple script pings a list of servers to see if they're alive.  It might help to add a suffix for the FQDN--
#>

$name = [Environment]::Username
$servers = "c:\users\$name\desktop\servers.txt"


foreach ($s in $servers)
	{
	ping -n 1 $s where
	}

