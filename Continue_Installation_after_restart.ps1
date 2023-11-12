
$taskName = "RunAfterLogin"
Unregister-ScheduledTask -TaskName $taskName -Confirm:$false

<# Importing the OS #>
Write-Host "`tImporting the OS from C:\temporary to C:\ns3-Ubuntu-20.04`n" -ForegroundColor Yellow
Write-Host "`tThis can take about 10-15 minutes, please be patient`n" -ForegroundColor Yellow
wsl --import ns3-Ubuntu-20.04 C:\ns3-Ubuntu-20.04 C:\temporary\TIMSCDR-Ubuntu-20.04

# Starting Windows Terminal for Profile Creation #
Start-Process wt -WindowStyle Hidden

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
