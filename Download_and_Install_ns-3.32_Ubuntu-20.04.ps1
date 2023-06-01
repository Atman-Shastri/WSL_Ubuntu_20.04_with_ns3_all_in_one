# This script downloads Ubuntu 20.04 with pre-installed programs related to networking with linux (MCA Program course 22-24) #
# (includes ns3-allinone and tracemetrics) #


<# Downloading TIMSCDR Ubuntu WSL machine #>

# Creating script's working directory #        
$trashVar = mkdir -OutVariable output C:\temporary\
$trashVar

# Testing Windows Terminal for Profile Creation #
Write-Host "`tTesting Windows Terminal for Profile Creation`n" -ForegroundColor Yellow
# Starting Windows Terminal
Start-Process wt

# Waiting for 2 seconds
Start-Sleep -Seconds 2

# Finding the process ID for Windows Terminal
$wtProcess = Get-Process | Where-Object { $_.Path -like '*WindowsTerminal.exe' }
$wtProcessId = $wtProcess.Id

# Stopping Windows Terminal using the process ID
Stop-Process -Id $wtProcessId

# Downloading wget & 7-zip binaries to C:\temporary #
Write-Host "`tDownloading wget & 7-zip binaries to C:\temporary`n" -ForegroundColor Yellow
$ProgressPreference = "SilentlyContinue"
Invoke-WebRequest https://eternallybored.org/misc/wget/1.21.4/64/wget.exe -O "C:\temporary\wget.exe"
Invoke-WebRequest https://www.7-zip.org/a/7zr.exe -O "C:\temporary\7zr.exe"

# Downloading TIMSCDR-Ubuntu-20-04.7z to C:\temporary folder" #
Write-Host "`n`tDownload size is 1.82 gb, and the OS will reside in C:\TIMSCDR-Ubuntu-20.04, consuming 7 gb storage space" -ForegroundColor Yellow
Write-Host "`tDownloading the ns3.32-Ubuntu-20.04 from OneDrive`n" -ForegroundColor Yellow
Write-Host "`n`tIf Script fails to download the OS, download it from here: https://drive.google.com/file/d/1I1rJfOcfIffNtPC5M3Qx-IPVIw5FgYQo/view?usp=drive_link" -ForegroundColor Yellow
Write-Host "`n`tCheck the ending of readme after downloading the OS to C:\temporary" -ForegroundColor Yellow
C:\temporary\wget.exe  -t 0 -O "C:\temporary\TIMSCDR-Ubuntu-20.04.7z" "https://ktokpa.sn.files.1drv.com/y4meXurSB3sCLcGjmCoWxCa2sQkgUtmQkuJ5iAbYwilWi_JCnSDMl3-0N73vDm9PoOgWu5JPzm7vAgBiUKobniW4eDKciHO9c7YMJb2dhPaVUS-h00k4xc5Cfe_8gYK20WvSwlIsofXUtbNdGBITTeNjD7H-8e47JkGlPg7mLIgxwcbw48z7yWZkIi2_KWmYhZ_sjHMAY9pb27nIZZ1deZHZA"

# Extracting TIMSCDR-Ubuntu-20.04.7z to the C:\temporary #
Write-Host "`tExtracting the download to C:\temporary`n" -ForegroundColor Yellow
C:\temporary\7zr.exe x "C:\temporary\TIMSCDR-Ubuntu-20.04.7z" -o"C:\temporary" -y


<# Checking and enabling pre-requisites (WSL and Virtual Machine Platform) #>
Write-Host "`tEnabling Windows Subsystem Linux`n" -ForegroundColor Yellow
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
Write-Host "`tEnabling Virtual Machine Platform`n" -ForegroundColor Yellow
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart


<# Setting up profile in windows Terminal #>
Write-Host "`tSetting up Ubuntu profile in Windows Terminal`n" -ForegroundColor Yellow
# Path to the JSON file #
$jsonFilePath = "C:\Users\$env:USERNAME\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"


# Text to append
$newProfile = @{
    "name"              = "TIMSCDR-Ubuntu-20.04";
    "colorScheme"       = "Ubuntu-ColorScheme";
    "commandline"       = "wsl.exe -d TIMSCDR-Ubuntu-20.04";
    "startingDirectory" = "~";
    "icon"              = "ms-appx:///ProfileIcons/{9acb9455-ca41-5af7-950f-6bca1bc9722f}.png";
}

$colorScheme = @{
    "background"          = "#300A24";
    "black"               = "#171421";
    "blue"                = "#0037DA";
    "brightBlack"         = "#767676";
    "brightBlue"          = "#08458F";
    "brightCyan"          = "#2C9FB3";
    "brightGreen"         = "#26A269";
    "brightPurple"        = "#A347BA";
    "brightRed"           = "#C01C28";
    "brightWhite"         = "#F2F2F2";
    "brightYellow"        = "#A2734C";
    "cursorColor"         = "#FFFFFF";
    "cyan"                = "#3A96DD";
    "foreground"          = "#FFFFFF";
    "green"               = "#26A269";
    "name"                = "Ubuntu-ColorScheme";
    "purple"              = "#881798";
    "red"                 = "#C21A23";
    "selectionBackground" = "#FFFFFF";
    "white"               = "#CCCCCC";
    "yellow"              = "#A2734C";
}

# Read the JSON file contents
$jsonContent = Get-Content -Path $jsonFilePath | ConvertFrom-Json

#appending color ubuntu scheme
$jsonContent.schemes += $colorScheme

#appending new ubuntu profile
$jsonContent.profiles.list += $newProfile

# Converting the updated JSON content back to a string
$jsonString = $jsonContent | ConvertTo-Json -Depth 10

# Writing the updated JSON string back to the file
$jsonString | Out-File -FilePath $jsonFilePath -Encoding utf8 -Force

<# ignore this line, its for testing purposes
cp C:\Users\$env:USERNAME\Desktop\DELL-G3-wt-og.json C:\Users\$env:USERNAME\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json
#>

<# Importing the OS #>
Write-Host "`tInstalling WSL`n" -ForegroundColor Yellow
wsl --install -n
Write-Host "`tUninstalling default latest Ubuntu`n" -ForegroundColor Yellow
wsl --unregister Ubuntu
Write-Host "`tImporting the OS`n" -ForegroundColor Yellow
wsl --import TIMSCDR-Ubuntu-20.04 C:\TIMSCDR-Ubuntu-20.04 C:\temporary\TIMSCDR-Ubuntu-20.04.tar


<# Cleaning up, removing C:\temporary #>
Write-Host "`tCleaning up, moving C:\temporary to recycle bin`n" -ForegroundColor Yellow
$folderPath = "C:\temporary"

# Loading the Microsoft.VisualBasic assembly
Add-Type -AssemblyName Microsoft.VisualBasic

# Moving the folder to the recycle bin
[Microsoft.VisualBasic.FileIO.FileSystem]::DeleteDirectory($folderPath, [Microsoft.VisualBasic.FileIO.UIOption]::OnlyErrorDialogs, [Microsoft.VisualBasic.FileIO.RecycleOption]::SendToRecycleBin)
