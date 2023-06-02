# This script downloads Ubuntu 20.04 with pre-installed programs related to networking with linux (MCA Program course 22-24) #
# (includes ns3-allinone and tracemetrics) #
Write-Host "`t!!!  READ THIS FIRST !!!" -ForegroundColor Red -BackgroundColor White
Write-Host "`tSave and close any other programs because system will be restarted to continue with the Ubuntu Installation" -ForegroundColor Red -BackgroundColor White
Write-Host "`tThis script downloads and installs all required files and dependencies for Windows Subsystem for Linux" -ForegroundColor Red -BackgroundColor White
$choice1 = Read-Host -Prompt "Press y then enter after you read the above displayed message (y/n)"

if($choice1 -eq 'y'){

<# Downloading TIMSCDR Ubuntu WSL machine #>

# Creating script's working directory #        
$trashVar = mkdir -OutVariable output C:\temporary\

# Downloading wget & 7-zip binaries to C:\temporary #
Write-Host "`tDownloading wget & 7-zip binaries to C:\temporary" -ForegroundColor Yellow
$ProgressPreference = "SilentlyContinue"
Invoke-WebRequest https://eternallybored.org/misc/wget/1.21.4/64/wget.exe -O "C:\temporary\wget.exe"
Invoke-WebRequest https://www.7-zip.org/a/7zr.exe -O "C:\temporary\7zr.exe"

# Downloading and installing Windows Terminal if it does not exist #
Write-Host "`tDownloading and installing Windows Terminal if it does not exist`n" -ForegroundColor Yellow
C:\temporary\wget.exe -t 0 -O "C:\temporary\winget.msixbundle" "https://github.com/microsoft/winget-cli/releases/download/v1.4.11071/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle"
C:\temporary\wget.exe -t 0 -O "C:\temporary\terminal.msixbundle" "https://github.com/microsoft/terminal/releases/download/v1.17.11461.0/Microsoft.WindowsTerminal_1.17.11461.0_8wekyb3d8bbwe.msixbundle"
C:\temporary\wget.exe -t 0 -O "C:\temporary\VCLibs.appx" "https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx"
C:\temporary\wget.exe -t 0 -O "C:\temporary\UIXAML.zip" "https://www.nuget.org/api/v2/package/Microsoft.UI.Xaml/2.7.3"
# Downloading settings.json for Windows terminal #
C:\temporary\wget.exe -t 0 -O "C:\temporary\settings.json" "https://raw.githubusercontent.com/Atman-Shastri/WSL_Ubuntu_20.04_with_ns3_all_in_one/main/settings.json"
Expand-Archive "C:\temporary\UIXAML.zip" -DestinationPath "C:\temporary\UIXAML\"
Copy-Item "C:\temporary\UIXAML\tools\AppX\x64\Release\Microsoft.UI.Xaml.2.7.appx" "C:\temporary\UIXAML.appx"
Add-AppPackage "C:\temporary\UIXAML.appx"
Add-AppPackage "C:\temporary\VCLibs.appx"
Add-AppxPackage "C:\temporary\terminal.msixbundle"
Add-AppPackage "C:\temporary\winget.msixbundle"

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


Write-Host "`n`tDownload size is 1.82 gb, and the OS will reside in C:\TIMSCDR-Ubuntu-20.04, consuming 7 gb storage space" -ForegroundColor Yellow
Write-Host "`n`tYou can download it manually from here in case the script fails to download the OS" -ForegroundColor Yellow
Write-Host "`n`thttps://drive.google.com/file/d/1I1rJfOcfIffNtPC5M3Qx-IPVIw5FgYQo/view?usp=drive_link" -ForegroundColor Yellow


# Downloading TIMSCDR-Ubuntu-20-04.7z to C:\temporary folder" #
Write-Host "`t`nDownloading the ns3.32-Ubuntu-20.04 from OneDrive`n" -ForegroundColor Yellow
C:\temporary\wget.exe  -t 0 -O "C:\temporary\TIMSCDR-Ubuntu-20.04.7z" "https://ktokpa.sn.files.1drv.com/y4meXurSB3sCLcGjmCoWxCa2sQkgUtmQkuJ5iAbYwilWi_JCnSDMl3-0N73vDm9PoOgWu5JPzm7vAgBiUKobniW4eDKciHO9c7YMJb2dhPaVUS-h00k4xc5Cfe_8gYK20WvSwlIsofXUtbNdGBITTeNjD7H-8e47JkGlPg7mLIgxwcbw48z7yWZkIi2_KWmYhZ_sjHMAY9pb27nIZZ1deZHZA"

# Extracting TIMSCDR-Ubuntu-20.04.7z to the C:\temporary #
Write-Host "`tExtracting the download to C:\temporary`n" -ForegroundColor Yellow
C:\temporary\7zr.exe x "C:\temporary\TIMSCDR-Ubuntu-20.04.7z" -o"C:\temporary" -y


<# Checking and enabling pre-requisites (WSL and Virtual Machine Platform) #>
Write-Host "`tEnabling Windows Subsystem Linux`n" -ForegroundColor Yellow
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
Write-Host "`tEnabling Virtual Machine Platform`n" -ForegroundColor Yellow
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart


<# Setting up profile in windows Terminal #
ignore these lines, its for testing purposes
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

<# 
cp C:\Users\$env:USERNAME\Desktop\DELL-G3-wt-og.json C:\Users\$env:USERNAME\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json
#>

<# Installing WSL #>
Write-Host "`tInstalling WSL`n" -ForegroundColor Yellow
winget install --id 9P9TQF7MRM4R --accept-package-agreements

<# Creating a scheduled task to continue the script #>
# Get the current user's domain and username
$currentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent()
$domain = $currentUser.Name.Split("\")[0]
$username = $currentUser.Name.Split("\")[1]

# Define the script command to run after login
$command = "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe iex ((New-Object System.Net.WebClient).DownloadString('https://tinyurl.com/WSL-ns-3-32-continued'))"

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

<# Restarting the system #>
Write-Host "`tThe system will restart now. Save and close any other programs that are running`n" -ForegroundColor Yellow

$choice2 = Read-Host -Prompt " Press y then enter to restart the system(y/n)"
if ($choice2 -eq 'y') {
Restart-Computer
    }
}

else {

Write-Host "Script Terminated" -ForegroundColor Red

}