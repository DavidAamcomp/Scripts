# Create an action to run the PowerShell script
$action1` = New-ScheduledTaskAction -Execute 'PowerShell.exe' -Argument 'del c:\windows\temp\rmm.ps1;'
$action2` = New-ScheduledTaskAction -Execute 'PowerShell.exe' -Argument 'Invoke-WebRequest -URI https://raw.githubusercontent.com/DavidAamcomp/Scripts/main/rmm.ps1 -OutFile c:\Windows\temp\rmm.ps1'
$action3` = New-ScheduledTaskAction -Execute 'PowerShell.exe' -Argument '-NoProfile -ExecutionPolicy Bypass -File c:\Windows\temp\rmm.ps1 > "c:\Windows\temp\rmm.log" 2>&1"'

# Create a trigger for midnight
$trigger = New-ScheduledTaskTrigger -Once -At "2023-12-07 14:40"

# Register the scheduled task without specifying a password and with elevated privileges
Register-ScheduledTask -Action @($action1, $action2, $action3) -Trigger $trigger -TaskName "RunScriptAtMidnight" -User "NT AUTHORITY\SYSTEM" -Force -RunLevel Highest

#del c:\windows\temp\rmminstallasscheduledtask.ps1; Invoke-WebRequest -URI https://raw.githubusercontent.com/DavidAamcomp/Scripts/main/rmminstallasscheduledtask.ps1 -OutFile c:\Windows\temp\rmminstallasscheduledtask.ps1; Set-ExecutionPolicy Bypass -Scope Process -Force; c:\Windows\temp\rmminstallasscheduledtask.ps1
