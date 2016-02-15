#Powershell Playset
#Web Application Cleanup
<#!!!!!BE CAREFUL WHEN YOU RUN THIS.  IT DELETES ALL THE WEB APPLICATIONS IN YOUR FARM!!!!

NO SERIOUSLY, DONT DO THIS IN PRODUCTION IF YOU KNOW WHAT'S GOOD FOR YOU

ITS NOT GOING TO GIVE YOU ANY WARNING.  
#>


$me = [environment]::Username
#Start-transcript -path "c:\users\$me\desktop\cleanup.txt"
Add-PSSnapin microsoft.sharepoint.powershell


$webs= get-spwebapplication

foreach ($web in $webs)
	{
	write-host "Removing $web Web Application"
	remove-spwebapplication $web -DeleteIISSite -RemoveContentDatabases -Confirm:$false
	}
Stop-transcript
