#Powershell Playset
#SharePoint, redeploy solutions script

#redeploysolutions.ps1
#This will redeploy farm solutions that are not currently deployed (when updating them)

# Defined variables:  current user, transcript log file path, list of solutions not deployed
$name = [environment]::UserName
$path = "c:\users\$name\desktop\transcript.log"
$notdeployed = Get-SPSolution |Where-Object {$_.Deployed -ne "True"} |Sort-Object {$_.Name} #Solutions not deployed sorted by name

Start-Transcript -path $path -Append -NoClobber

Add-PSSnapin microsoft.sharepoint.powershell 

foreach ($n in $notdeployed) #deploys solutions one at a time that are currently not deployed
    {
    try {
        write-host "Deploying $not Solution"
        Install-SPSolution $n -GACDeployment -Force -Confirm:$false
        }
    catch
        {
        write-host "Problem deploying $n . It needs to be redeployed" -BackgroundColor White -ForegroundColor Darked
        }
        write-host "$n has been deployed successfully" -BackgroundColor black -ForegroundColor DarkGreen
    }
Stop-Transcript