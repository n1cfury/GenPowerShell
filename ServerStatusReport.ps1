#Server Ping report that provides an up/down status

$me = [environment]::UserName
$servers= get-content "c:\users\$me\desktop\servers.txt"
$collection = $()
foreach ($server in $servers)
{
    $status = @{ "ServerName" = $server}
    if (Test-Connection $server -Count 1 -ea 0 -Quiet)
    {
        $status["Results"] = "Up"
    }
    else
    {
        $status["Results"] = "Down"
    }
    New-Object -TypeName PSObject -Property $status -OutVariable serverStatus
    $collection += $serverStatus

}
$collection | Export-Csv -LiteralPath .\results.csv -NoTypeInformation


