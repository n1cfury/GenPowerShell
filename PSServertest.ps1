#Powershell Playset
#

[environment]::Username
$Computers = Get-Content "c:\users\conkywadmin\desktop\servers.txt"
Test-Connection $Computers | Out-File "c:\users\conkywadmin\desktop\servers.txt"
