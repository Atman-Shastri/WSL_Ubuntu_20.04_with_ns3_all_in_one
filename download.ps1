    # This script downloads Ubuntu with pre-installed programs related to MCA Program course 22-24 #
                       # (includes ns3-allinone and tracemetrics) #

                        <# Downloading TIMSCDR Ubuntu WSL machine #>
      
# Creating script's working directory#        
$trashVar = mkdir -OutVariable output C:\temporary\
$trashVar
# Downloading wget & 7-zip binaries to C:\temporary #
Write-Progress -Activity 'Downloading wget & 7-zip binaries to C:\temporary' -Status "Saving to folder" -PercentComplete 75
$ProgressPreference = "SilentlyContinue"
Invoke-WebRequest https://eternallybored.org/misc/wget/1.21.4/64/wget.exe -O "C:\temporary\wget.exe"
Invoke-WebRequest https://www.7-zip.org/a/7zr.exe -O "C:\temporary\7zr.exe"

Write-Progress -Activity 'Downloading ns3.32-Ubuntu-20.04' -Status 'Downloading'
# Downloading TIMSCDR-Ubuntu-20-04.7z to C:\temporary folder" #

Write-Host "Download size is 1.82 gb, and the OS will reside in C:\TIMSCDR-Ubuntu-20.04, consuming 7 gb storage space"

C:\temporary\wget.exe -t 0 -O "C:\temporary\TIMSCDR-Ubuntu-20.04.7z" "https://media.githubusercontent.com/media/Atman-Shastri/WSL_Ubuntu_20.04_with_ns3_all_in_one/main/TIMSCDR-Ubuntu-20.04.7z"

Write-Host "If Script fails to download the OS, download it from here: https://drive.google.com/file/d/1by4Ou977Wtm0I5OFzQRX1vBx1Fs283re/view?usp=drive_link"

### Extracting TIMSCDR-Ubuntu-20.04.7z to the C:\temporary ###
C:\temporary\7zr.exe x "C:\temporary\TIMSCDR-Ubuntu-20.04.7z" -o"C:\temporary" -y

                                    <# Checking and enabling pre-requisites #>



                                  <# Setting up profile in windows Terminal #>
<# Path to the JSON file
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