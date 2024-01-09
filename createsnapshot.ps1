# Specify your Hyper-V server and virtual machine name
$HyperVServer = "localhost"
$VMName = "PADDsrv"

# Create a snapshot
Get-VM -ComputerName $HyperVServer -Name $VMName | Checkpoint-VM -SnapshotName "DailySnapshot_$(Get-Date -Format 'yyyyMMdd_HHmmss')"
