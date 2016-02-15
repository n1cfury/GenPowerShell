#Powershell Playset
#Add a bunch of users to a local group

$me = [environment]::Username
write-host "Enter the name of the group you want to add"
write-host "from $users"
$groupname = read-host "User names from $users"
$users = get-content -path "C:\users\$me\desktop\users.txt"
foreach ($u in $users)
	{net localgroup $groupname /add $u}
