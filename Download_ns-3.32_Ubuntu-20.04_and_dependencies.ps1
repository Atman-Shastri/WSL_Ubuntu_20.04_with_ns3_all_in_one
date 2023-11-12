# This script downloads Ubuntu 20.04 with pre-installed programs related to networking with linux (MCA Program course 22-24) #
# (includes ns3.32-allinone and tracemetrics) #
Write-Host "`t!!!  READ THIS FIRST !!!" -ForegroundColor Red -BackgroundColor White
Write-Host "`tSave and close any other programs because system will be restarted to continue with the Ubuntu Installation" -ForegroundColor Red -BackgroundColor White
Write-Host "`tThis script downloads and installs all required files and dependencies for Windows Subsystem for Linux" -ForegroundColor Red -BackgroundColor White
$choice1 = Read-Host -Prompt "Press y then enter after you read the above displayed message (y/n)"

if($choice1 -eq 'y'){

function DownloadFileAndSkipIfExists {
    param (
        [string]$url,
        [string]$destinationPath
    )

    if (Test-Path $destinationPath) {
        Write-Host "File already exists at $destinationPath. Skipping the download."
        return
    }

    try {
        Invoke-WebRequest -Uri $url -OutFile $destinationPath
        Write-Host "File downloaded successfully to $destinationPath."
    }
    catch {
        Write-Host "Error downloading the file: $($_.Exception.Message)"
        
    }
}

<# Downloading ns3 Ubuntu WSL machine #>
$directoryPath = "C:\temporary"

# Create the directory
try {
    $output = New-Item -ItemType Directory -Path $directoryPath -ErrorAction Stop
    Write-Host "Directory created successfully: $($output.FullName)"
}
catch {
    Write-Host "Error creating directory: $($_.Exception.Message)"
    # You can add more specific error handling if needed
}

# Downloading wget & 7-zip binaries to C:\temporary #
Write-Host "`tDownloading wget & 7-zip binaries to C:\temporary" -ForegroundColor Yellow
$ProgressPreference = "SilentlyContinue"
DownloadFileAndSkipIfExists -url https://eternallybored.org/misc/wget/1.21.4/64/wget.exe -destinationPath "C:\temporary\wget.exe"
DownloadFileAndSkipIfExists -url https://www.7-zip.org/a/7zr.exe -destinationPath "C:\temporary\7zr.exe"

try{
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
} catch {}

# Testing Windows Terminal for Profile Creation #
Write-Host "`tTesting Windows Terminal for Profile Creation`n" -ForegroundColor Yellow
# Starting Windows Terminal
Start-Process wt -WindowStyle Hidden


Write-Host "`n`tDownload size is 1.82 gb, and the OS will reside in C:\ns3-Ubuntu-20.04, consuming 7 gb storage space" -ForegroundColor Yellow

$directoryPath = "C:\temporary"
$fileName = "ns3-Ubuntu-20.04.7z"
$fileExists = Test-Path -Path (Join-Path $directoryPath $fileName)
if (-not $fileExists) {
    # Execute this code if the file doesn't exist
    Write-Host "File does not exist. Proceeding with the code."

    # Downloading ns3-Ubuntu-20-04.7z to C:\temporary folder" #
Write-Host "`tDownloading the ns3.32-Ubuntu-20.04 from OneDrive`n" -ForegroundColor Yellow
C:\temporary\wget.exe  -t 0 -O "C:\temporary\ns3-Ubuntu-20.04.7z" "https://ktokpa.sn.files.1drv.com/y4meXurSB3sCLcGjmCoWxCa2sQkgUtmQkuJ5iAbYwilWi_JCnSDMl3-0N73vDm9PoOgWu5JPzm7vAgBiUKobniW4eDKciHO9c7YMJb2dhPaVUS-h00k4xc5Cfe_8gYK20WvSwlIsofXUtbNdGBITTeNjD7H-8e47JkGlPg7mLIgxwcbw48z7yWZkIi2_KWmYhZ_sjHMAY9pb27nIZZ1deZHZA"

}
else {
    # Execute this code if the file exists
    Write-Host "File already exists."
}

$fileName = "TIMSCDR-Ubuntu-20.04.tar"
$fileExists = Test-Path -Path (Join-Path $directoryPath $fileName)
if (-not $fileExists) {
# Extracting ns3-Ubuntu-20.04.7z to the C:\temporary #
Write-Host "`tExtracting the download to C:\temporary`n" -ForegroundColor Yellow
C:\temporary\7zr.exe x "C:\temporary\ns3-Ubuntu-20.04.7z" -o"C:\temporary" -y
}else {
    # Execute this code if the file exists
    Write-Host "File already exists."
}

function Enable-WindowsOptionalFeature {
    param (
        [string]$featureName,
        [string]$message
    )

    $feature = Get-WindowsOptionalFeature -Online | Where-Object { $_.FeatureName -eq $featureName }

    if ($feature -and $feature.State -eq 'Enabled') {
        Write-Host "`t$featureName is already enabled. Skipping.`n" -ForegroundColor Yellow
    }
    else {
        Write-Host "`tEnabling $message`n" -ForegroundColor Yellow
        dism.exe /online /enable-feature /featurename:$featureName /all /norestart
    }
}
<# Checking and enabling pre-requisites (WSL and Virtual Machine Platform) #>
Enable-WindowsOptionalFeature -featureName "Microsoft-Windows-Subsystem-Linux" -message "Windows Subsystem for Linux"
Enable-WindowsOptionalFeature -featureName "VirtualMachinePlatform" -message "Virtual Machine Platform"

<# Installing WSL #>
Write-Host "`tInstalling WSL`n" -ForegroundColor Yellow
$wingetCommand = Get-Command -Name 'winget' -ErrorAction SilentlyContinue

if ($null -eq $wingetCommand) {
    Write-Host "Windows Package Manager (winget) is not available. Please ensure it is installed and in your PATH."
}
else {
    # Check if the package is already installed
    $packageId = '9P9TQF7MRM4R'
    $installedPackage = winget list --id $packageId | Select-String -Pattern $packageId

    if ($installedPackage) {
        Write-Host "Package with ID '$packageId' is already installed. Skipping installation."
    }
    else {
        # Install the package
        Write-Host "Installing the package..."
        winget install --id $packageId --accept-package-agreements
    }
}

<# Creating a scheduled task to continue the script #>
# Get the current user's domain and username
$currentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent()
$domain = $currentUser.Name.Split("\")[0]
$username = $currentUser.Name.Split("\")[1]

# Define the script command to run after login
$command = "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe"
$arguments = "iex(irm raw.githubusercontent.com/Atman-Shastri/WSL_Ubuntu_20.04_with_ns3_all_in_one/main/Continue_Installation_after_restart.ps1)"
# Create a scheduled task action to run the command
$action = New-ScheduledTaskAction -Execute $command -Argument $arguments

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
