# This script installs Ubuntu with pre-installed programs related to MCA Program course 22-24 #
# (includes ns3-allinone and tracemetrics) #


<# This script is in case you downloaded the 1.82gb OS from google drive
   This script assumes you already have TIMSCDR-Ubuntu-20.04.7z in C:\temporary folder #>

# Downloading wget & 7-zip binaries to C:\temporary #
Write-Host "`tThis script assumes you already have TIMSCDR-Ubuntu-20.04.7z in C:\temporary folder`n" -ForegroundColor Yellow
$choice = Read-Host -Prompt "Continue? (y/n)"
if ($choice -eq 'y') {
    Write-Host "`nContinuing..." -ForegroundColor Yellow
    Write-Host "`tDownloading wget & 7-zip binaries to C:\temporary`n" -ForegroundColor Yellow
    $ProgressPreference = "SilentlyContinue"
    Invoke-WebRequest https://eternallybored.org/misc/wget/1.21.4/64/wget.exe -O "C:\temporary\wget.exe"
    Invoke-WebRequest https://www.7-zip.org/a/7zr.exe -O "C:\temporary\7zr.exe"


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
$choice1 = Read-Host -Prompt "A window will popup for Host Process,choose yes. press y and then enter to continue the script(y/n)"
if ($choice1 -eq 'y'){
Write-Host "`nContinuing Installation of WSL..." -ForegroundColor Yellow
wsl --install -n
Write-Host "`nThe system will restart now." -ForegroundColor Yellow
Write-Host "`nRun the Continue_Installation_after_restart.ps1 after restart in the same manner as you ran this script" -ForegroundColor Yellow
Write-Host "`nRefer to 2nd command in readme file if in doubt" -ForegroundColor Yellow
$choice2 = Read-Host -Prompt "Press y then enter to restart(y/n)"
 if($choice2 -eq 'y'){
        restart-computer
     }
    }
}
else {
    Write-Host "`nScript Terminated before completion." -ForegroundColor Yellow
}