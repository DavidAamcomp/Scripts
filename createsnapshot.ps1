# Get the list of virtual machines
$VMs = Get-VM

# Set the snapshot name with the current date
$SnapshotName = "Snapshot_AllVMs_$(Get-Date -Format 'yyyyMMdd')"

# Iterate through each virtual machine and create a snapshot
foreach ($VM in $VMs) {
    # Create a snapshot for the virtual machine
    New-Snapshot -VM $VM -Name $SnapshotName -Confirm:$false

    Write-Host "Snapshot created for $($VM.Name)."
}
