#Requires -Module VMware.VimAutomation.Core

#Define Variables
$esx = Get-VMhost mzvmesx001*
$nfs = Get-VMHost $esx | Get-Datastore | Where-Object {$_.Type -eq 'NFS' -and $_.Accessible -eq 'True'}


#List NFS Datastore information Name, RemoteHost & RemotePath
$nfs.Name
$nfs.RemoteHost
$nfs.RemotePath
