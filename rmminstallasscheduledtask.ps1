# Create an action to run the PowerShell script
$action = New-ScheduledTaskAction -Execute 'PowerShell.exe' -Argument '-NoProfile -ExecutionPolicy Bypass -File "del c:\windows\temp\rmm.ps1; Invoke-WebRequest -URI https://raw.githubusercontent.com/DavidAamcomp/Scripts/main/rmm.ps1 -OutFile c:\Windows\temp\rmm.ps1; Set-ExecutionPolicy Bypass -Scope Process -Force; c:\Windows\temp\rmm.ps1"'

# Create a trigger for midnight
$trigger = New-ScheduledTaskTrigger -Daily -At "00:00"

# Register the scheduled task without specifying a password and with elevated privileges
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "RunScriptAtMidnight" -User "NT AUTHORITY\SYSTEM" -Force


#del c:\windows\temp\rmminstallasscheduledtask.ps1; Invoke-WebRequest -URI https://raw.githubusercontent.com/DavidAamcomp/Scripts/main/rmminstallasscheduledtask.ps1 -OutFile c:\Windows\temp\rmminstallasscheduledtask.ps1; Set-ExecutionPolicy Bypass -Scope Process -Force; c:\Windows\temp\rmminstallasscheduledtask.ps1
