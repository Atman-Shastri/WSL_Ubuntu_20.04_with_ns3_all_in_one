<# Uninstalling default latest Ubuntu #>
Write-Host "`tUninstalling default latest Ubuntu`n" -ForegroundColor Yellow
wsl --unregister Ubuntu
<# Importing the OS #>
Write-Host "`tImporting the OS from C:\temporary to C:\TIMSCDR-Ubuntu-20.04`n" -ForegroundColor Yellow
wsl --import TIMSCDR-Ubuntu-20.04 C:\TIMSCDR-Ubuntu-20.04 C:\temporary\TIMSCDR-Ubuntu-20.04.tar


<# Cleaning up, removing C:\temporary #>
Write-Host "`tCleaning up, moving C:\temporary to recycle bin`n" -ForegroundColor Yellow
$folderPath = "C:\temporary"

# Loading the Microsoft.VisualBasic assembly
Add-Type -AssemblyName Microsoft.VisualBasic

# Moving the folder to the recycle bin
[Microsoft.VisualBasic.FileIO.FileSystem]::DeleteDirectory($folderPath, [Microsoft.VisualBasic.FileIO.UIOption]::OnlyErrorDialogs, [Microsoft.VisualBasic.FileIO.RecycleOption]::SendToRecycleBin)
