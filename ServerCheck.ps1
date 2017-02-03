
#Ping Servers in a list


$user = [environment]::Username
$servers= get-content "c:\users\$user\servers.txt"
$ping= New-Object System.Net.NetworkInformation.Ping

foreach ($server in $servers )
    {
    $("$($ping.Send($server).Address)")
    
    }
    
