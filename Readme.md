1. Click on code, download zip and extract it (preferably in D: or E: or where folder paths are shorter):
![image](https://github.com/Atman-Shastri/WSL_Ubuntu_20.04_with_ns3_all_in_one/assets/126988436/339a9ee2-7068-4174-8542-a85a197da2d6)

2. Run Powershell as administrator and cd to the directory where the repo folder is downloaded/cloned :

3. Run this command in Powershell:
powershell.exe -ExecutionPolicy Bypass -File .\ns-3.32_Ubuntu-20.04_Download_and_Install.ps1

- Download size is 1.82 gb, and the OS will reside in C:\TIMSCDR-Ubuntu-20.04, consuming 7 gb storage space
- The password for the OS is the same as students use in lab: "mca@123"

- If the script fails to download, alternatively you can download the OS from here:
- https://drive.google.com/file/d/1by4Ou977Wtm0I5OFzQRX1vBx1Fs283re/view?usp=drive_link
- Make a folder named `temporary` in C: drive and store the 1.82gb file there before running the Only_Install script
- Mail me at atmanshastri@gmail.com if any issues or queries
