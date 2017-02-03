#Verifies multiple servers (read from servers.txt, located on the current user's desktop) have a specified patch
 
#checks multiple servers in 'servers.txt' for a particular patch
$me = [environment]::Username
$CheckComputers = get-content C:\users\$me\desktop\servers.txt
# Define Hotfix to check
$CheckHotFixKB = "KB2880963";
foreach($CheckComputer in $CheckComputers)
	{
	 $HotFixQuery = Get-HotFix -ComputerName $CheckComputer | Where-Object {$_.HotFixId -eq $CheckHotFixKB} | Select-Object -First 1;
	 if($HotFixQuery -eq $null)
	 {
	  Write-Host "Hotfix $CheckHotFixKB is not installed on $CheckComputer";
	 }
	 else
	 {
	  Write-Host "Hotfix $CheckHotFixKB was installed on $CheckComputer on by " $($HotFixQuery.InstalledBy);
	 }
	}