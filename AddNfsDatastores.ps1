#Requires -Modules VMware.VimAutomation.Core

#Defined Variables
$ESXiHosts = Get-VMHost mzvmesx*

##Adds Multiple NFS Datastores to multiple hosts
ForEach ($esx in $ESXiHosts)
{New-Datastore -Nfs -VMHost $esx -Name DS1_Heartbeat -Path /mnt/labvg/nfsvol1/DS1_Heartbeat -NfsHost 192.168.1.212
New-Datastore -Nfs -VMhost $esx -Name DS2_Heartbeat -Path /mnt/labvg/nfsvol2/DS2_Heartbeat -NfsHost 192.168.1.212}
