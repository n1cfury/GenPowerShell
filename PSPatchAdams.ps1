#Powershell Playset
#confirm KB article you enter is installed on the server(s) you're checking

$patch = read-host "Enter KB article for the patch"
get-hotfix -id $patch |Out-GridView
