# This script downloads Ubuntu with pre-installed programs related to MCA Program course 22-24 #
                       # (includes ns3-allinone and tracemetrics) #

                        <# Downloading TIMSCDR Ubuntu WSL machine #>
      
# Creating script's working directory#        
$trashVar = mkdir -OutVariable output C:\temporary\
$trashVar
# Downloading wget #
Write-Progress -Activity 'Downloading wget' -Status "Saving to folder" -PercentComplete 75
$ProgressPreference = "SilentlyContinue"
Invoke-WebRequest https://eternallybored.org/misc/wget/1.21.4/64/wget.exe -O "C:\temporary\wget.exe"


# Setting protocol to TLS version 1.2 #
#[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Write-Progress -Activity 'Downloading ns3.32-Ubuntu-20.04' -Status 'Downloading'
# Downloading TIMSCDR-Ubuntu-20-04.tar to C:\temporary folder" #

C:\temporary\wget.exe -t 0 -O "C:\temporary\TIMSCDR-Ubuntu-20.04.tar" "https://drive.google.com/uc?export=download&confirm=&id=1by4Ou977Wtm0I5OFzQRX1vBx1Fs283re"

Write-Host "If Script fails to download, download it from here: https://drive.google.com/file/d/1by4Ou977Wtm0I5OFzQRX1vBx1Fs283re/view?usp=drive_link"

Write-Progress -Activity 'Downloading ns3.32-Ubuntu-20.04' -Status 'Download Complete' -Completed

<# Extract the downloaded file
#Expand-Archive -LiteralPath "C:\temporary\Ubuntu_ns_all_in_one.tar" -DestinationPath "C:\temporary\" -Force

# Clean up - delete the downloaded file
#Remove-Item "C:\temporary\Ubuntu_ns_all_in_one.tar"
<#
### Installing 7-zip ###
winget install -e --id 7zip.7zip

### Extracting TIMSCDR-Ubuntu-20.04.7z to the C:\temporary ###
7z.exe x "C:\temporary\TIMSCDR-Ubuntu-20.04.7z" -o"C:\temporary" -y














<#
### Downloading Ubuntu with pre-installed MCA Program course related programs(includes ns3-allinone and tracemetrics) ###

# Setting protocol to TLS version 1.2
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# Downloading TIMSCDR-Ubuntu-20-04.tar to C:\temporary folder"
#mkdir C:\temporary\
#$ProgressPreference = 'SilentlyContinue'
#Invoke-WebRequest -Uri "https://drive.google.com/uc?export=download&id=1by4Ou977Wtm0I5OFzQRX1vBx1Fs283re" -OutFile "_tmp.txt" -SessionVariable googleDriveSession
#$searchString = Select-String -Path "_tmp.txt" -Pattern "confirm=.*&amp;id="
#$confirmCode = $searchString.Matches.Value -replace "confirm=|&amp;id="
#Remove-Item "_tmp.txt"
#Invoke-WebRequest -Uri "https://drive.google.com/uc?export=download&confirm=${confirmCode}&id=1by4Ou977Wtm0I5OFzQRX1vBx1Fs283re" -OutFile "C:\temporary\TIMSCDR-Ubuntu-20.04.tar" -WebSession $googleDriveSession

# Extract the downloaded file
#Expand-Archive -LiteralPath "C:\temporary\Ubuntu_ns_all_in_one.tar" -DestinationPath "C:\temporary\" -Force

# Clean up - delete the downloaded file
#Remove-Item "C:\temporary\Ubuntu_ns_all_in_one.tar"

###Setting up profile in windows Terminal###
# Path to the JSON file
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



#appending color scheme
$jsonContent.schemes += $colorScheme

#appending new profile
$jsonContent.profiles.list += $newProfile

# Converting the updated JSON content back to a string
$jsonString = $jsonContent | ConvertTo-Json -Depth 10

# Writing the updated JSON string back to the file
$jsonString | Out-File -FilePath $jsonFilePath -Encoding utf8 -Force

<# ignore this line, its for testing purposes
cp C:\Users\$env:USERNAME\Desktop\DELL-G3-wt-og.json C:\Users\$env:USERNAME\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json
#>