#This is a sysadmin tool used for adding multiple domain user objects to local groups

#This could be tweaked to add to an AD group 

$me = [environment]::Username
write-host "Enter the name of the group you want to add"
write-host "from $users"
$groupname = read-host "User names from $users"
$users = get-content -path "C:\users\$me\desktop\users.txt"
foreach ($u in $users)
	{net localgroup $groupname /add $u}
