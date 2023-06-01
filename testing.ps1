# This script downloads Ubuntu 20.04 with pre-installed programs related to networking with linux (MCA Program course 22-24) #
# (includes ns3-allinone and tracemetrics) #


<# Downloading TIMSCDR Ubuntu WSL machine #>

# Creating script's working directory #        
$trashVar = mkdir -OutVariable output C:\temporary\
$trashVar

# Downloading wget & 7-zip binaries to C:\temporary #
Write-Host "`tDownloading wget & 7-zip binaries to C:\temporary`n" -ForegroundColor Yellow
$ProgressPreference = "SilentlyContinue"
Invoke-WebRequest https://eternallybored.org/misc/wget/1.21.4/64/wget.exe -O "C:\temporary\wget.exe"
Invoke-WebRequest https://www.7-zip.org/a/7zr.exe -O "C:\temporary\7zr.exe"

# Downloading TIMSCDR-Ubuntu-20-04.7z to C:\temporary folder" #
Write-Host "`n`tDownload size is 1.82 gb, and the OS will reside in C:\TIMSCDR-Ubuntu-20.04, consuming 7 gb storage space" -ForegroundColor Yellow
Write-Host "`tDownloading the ns3.32-Ubuntu-20.04 from OneDrive`n" -ForegroundColor Yellow
C:\temporary\wget.exe  -t 0 -O "C:\temporary\TIMSCDR-Ubuntu-20.04.7z" "https://ktokpa.sn.files.1drv.com/y4meXurSB3sCLcGjmCoWxCa2sQkgUtmQkuJ5iAbYwilWi_JCnSDMl3-0N73vDm9PoOgWu5JPzm7vAgBiUKobniW4eDKciHO9c7YMJb2dhPaVUS-h00k4xc5Cfe_8gYK20WvSwlIsofXUtbNdGBITTeNjD7H-8e47JkGlPg7mLIgxwcbw48z7yWZkIi2_KWmYhZ_sjHMAY9pb27nIZZ1deZHZA"
Write-Host "`n`tIf Script fails to download the OS, download it from here: https://drive.google.com/file/d/1by4Ou977Wtm0I5OFzQRX1vBx1Fs283re/view?usp=drive_link" -ForegroundColor Yellow

