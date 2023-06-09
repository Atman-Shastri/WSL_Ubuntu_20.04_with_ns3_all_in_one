
$taskName = "RunAfterLogin"
Unregister-ScheduledTask -TaskName $taskName -Confirm:$false

<# Importing the OS #>
Write-Host "`tImporting the OS from C:\temporary to C:\ns3-Ubuntu-20.04`n" -ForegroundColor Yellow
Write-Host "`tThis can take about 10-15 minutes, please be patient`n" -ForegroundColor Yellow
wsl --import ns3-Ubuntu-20.04 C:\ns3-Ubuntu-20.04 C:\temporary\ns3-Ubuntu-20.04.tar

# Starting Windows Terminal for Profile Creation #
Start-Process wt

# Waiting for 2 seconds
Start-Sleep -Seconds 2

# Finding the process ID for Windows Terminal
$wtProcess = Get-Process | Where-Object { $_.Path -like '*WindowsTerminal.exe' }
$wtProcessId = $wtProcess.Id

# Stopping Windows Terminal using the process ID
Stop-Process -Id $wtProcessId


<# Making sure windows terminal profile creation is accurate#>
Copy-Item "C:\Users\$env:USERNAME\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json" "C:\Users\$env:USERNAME\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json.bak"
Copy-Item "C:\temporary\settings.json" "C:\Users\$env:USERNAME\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"

<# Launching ns-3.32_Ubuntu-20.04 #>
Write-Host "`nThe sudo password is mca@123. Refer the readme for additional information" -ForegroundColor Yellow
Write-Host "`nYou can delete the C:\temporary folder after launching Ubuntu. Ready to simulate networks?" -ForegroundColor Yellow
$choice1 = Read-Host -Prompt "Press y then enter(y/n)"
if ($choice1 -eq 'y') {
wt -p "ns3-Ubuntu-20.04"
} 