# Get the current user's domain and username
$currentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent()
$domain = $currentUser.Name.Split("\")[0]
$username = $currentUser.Name.Split("\")[1]

# Define the script command to run after login
$command = "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe iex ((New-Object System.Net.WebClient).DownloadString('https://tinyurl.com/WSL-ns-3-32-Ubuntu-20-04'))"

# Create a scheduled task action to run the command
$action = New-ScheduledTaskAction -Execute $command

# Create a trigger for the scheduled task (logon event)
$trigger = New-ScheduledTaskTrigger -AtLogOn

# Create the scheduled task
$taskParams = @{
    TaskName = "RunAfterLogin"
    Action = $action
    Trigger = $trigger
    User = "$domain\$username"  
    RunLevel = "Highest"
}

Register-ScheduledTask @taskParams | Out-Null


$choice = Read-Host -Prompt "Execution before restart...(y/n)"
if ($choice -eq 'y'){
Restart-Computer
}