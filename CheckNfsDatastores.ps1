#Requires -Modules VMware.VimAutomation.Core

#Define Variables
$targets = "DS1_Heartbeat","DS2_Heartbeat","DS3_Heartbeat"
$esxhosts = Get-Cluster Nested_Hosts | Get-VMhost

#Check all ESXi Hosts and list whether the datastore exists or not.
foreach($esx in $esxhosts)
{
    $nfs = Get-VMHost $esx | Get-Datastore | Where-Object Type -eq 'NFS'
  foreach($target in $targets)
  {
  if ($nfs | Where-Object Name -eq $target)
  {Write-Host "NFS datastore $target exists on host $esx" -ForegroundColor Green}
  else
  {Write-Host "NFS datastore $target does not exist on host $esx" -ForegroundColor Red}
#  Write-Host “NFS datastore $target is being added on host $esx” -ForegroundColor Yellow}
  }
}
