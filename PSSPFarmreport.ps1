#Farm Report
#Gathers basic information about your farm

Add-PSSnapin microsoft.sharepoint.powershell

#Defined Variables for this script
$build = (get-spfarm).buildversion
$webapps = get-spwebapplication -includecentraladministration |select DisplayName, Url
$svcaccts = get-spmanagedaccount |select UserName
$svcapps = Get-SPServiceApplication |Select Name, typename, id |ft -AutoSize
$configdb = get-spfarm |select Name
$spserver = get-spserver |Select Name


#Displays farm build, configuration database, farm servers, and sql aliases
write-host "The current farm version is: $build" -BackgroundColor white -ForegroundColor blue
write-host "The configuration database is: $configdb" -BackgroundColor white -ForegroundColor blue

#Lists 
write-host "     Service Accounts Used                 "
$svcaccts

#Display Web Applications in the farm
write-host "     Web Applications for this farm        "
$webapps


#Displays Content Databases in each web application
write-host "     Content Databases in the farm         "
foreach ($web in $webapps)
    {
        write-host ""
        write-host "Listing Databases for $web Web Application" -ForegroundColor yellow -BackgroundColor Red
        get-spcontentdatabase -webapplication $web |select Name, Server
        write-host ""
    }

#Service Instances
Get-SPServiceInstance |select typeName, Server, ID, status |sort Status -Descending |ft -AutoSize