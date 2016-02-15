#Powershell Playset
#Workflow Retention Update
# Sample Usage
# Set-SPListWorkflowAssocationCleanup -WebUrl "http://intranet" -ListName "Shared Documents" -CleanupDays 365 -ReportOnly:$false

Add-PSSnapin Microsoft.SharePoint.PowerShell -ErrorAction SilentlyContinue

function Set-SPListWorkflowAssocationCleanup {
    param (
        [string] $WebUrl = $(Read-Host -prompt "Enter a Url"),
        [string] $ListName = $(Read-Host -prompt "Enter a List Name"),
        [int32] $CleanupDays = $(Read-Host -prompt "Enter the number of Cleanup Days"),
        [switch] $ReportOnly = $true
        )        
 
    $web = Get-SPWeb $WebUrl;
    if ($web -eq $null) {
        Write-Error -message "Error: Web Not Found" -category InvalidArgument
    } else {
        $list = $web.Lists[$ListName];
        if ($list -eq $null) {
            Write-Error -message "Error: List Not Found" -category InvalidArgument
        } else {
            [Microsoft.SharePoint.Workflow.SPWorkflowAssociation[]] $wfaMods = @();
            foreach ($wfa in $list.WorkflowAssociations) {
                $message = "Found Workflow Association for " + $wfa.Name + " with AutoCleanupDays set to " + $wfa.AutoCleanupDays
                Write-Verbose -message $message -verbose
 
                if ($ReportOnly -eq $false) {
                    $wfa.AutoCleanupDays = $CleanupDays;
                    $wfaMods = $wfaMods + $wfa;
                }
            }
 
            if ($ReportOnly -eq $false) {
                foreach ($wfa in $wfaMods) {
                    $message = "Setting AutoCleanupDays for " + $wfa.Name + " to " + $CleanupDays
                    Write-Verbose -message $message -verbose
                    $list.WorkflowAssociations.Update($wfa);
                }
            }
        }
    }
}