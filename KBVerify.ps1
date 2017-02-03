#Validates KB articles and outputs them into the Powershell Grid View

$patch = read-host "Enter KB article for the patch e.g. 'KB123456' "
get-hotfix -id $patch |Out-GridView
