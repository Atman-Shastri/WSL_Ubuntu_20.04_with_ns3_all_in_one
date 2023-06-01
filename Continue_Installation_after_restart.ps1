<# Uninstalling default latest Ubuntu #>
Write-Host "`tUninstalling default latest Ubuntu if exists`n" -ForegroundColor Yellow
wsl --unregister Ubuntu
<# Importing the OS #>
Write-Host "`tImporting the OS from C:\temporary to C:\TIMSCDR-Ubuntu-20.04`n" -ForegroundColor Yellow
wsl --import TIMSCDR-Ubuntu-20.04 C:\TIMSCDR-Ubuntu-20.04 C:\temporary\TIMSCDR-Ubuntu-20.04.tar


<# Launching ns-3.32_Ubuntu-20.04 #>
$choice1 = Read-Host -Prompt "You can delete the C:\temporary folder after launching Ubuntu. Ready to simulate networks? Press y then enter(y/n)"

if ($choice1 -eq 'y'){
wt -p "TIMSCDR-Ubuntu-20.04"
}