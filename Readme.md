## WSL_Ubuntu_20.04_with_ns3_all_in_one (includes tracemetrics and default-jdk as well) ##
### Automating WSL installation, providing Ubuntu 20.04 with pre-installed programs & dependencies related to networking with linux (MCA Program course 22-24) ###

Steps:

1. Click on code, download zip and extract it (preferably in D: or E: or where folder paths are shorter):

![Readme 1](https://github.com/Atman-Shastri/WSL_Ubuntu_20.04_with_ns3_all_in_one/assets/126988436/df21ab78-96b0-48b6-b9fb-83afc90f1224)
![Readme 2](https://github.com/Atman-Shastri/WSL_Ubuntu_20.04_with_ns3_all_in_one/assets/126988436/48f9ae6a-ce70-4a78-93d0-3877c4bc3cc8)


2. Run Powershell as administrator and cd to the directory where the repo folder is downloaded/cloned :

![readme 3](https://github.com/Atman-Shastri/WSL_Ubuntu_20.04_with_ns3_all_in_one/assets/126988436/2ec9593a-c447-43b1-92a6-1ac1336b0c5a)

3. Run this command in Powershell:
powershell.exe -ExecutionPolicy Bypass -File .\Download_and_Install_ns-3.32_Ubuntu-20.04.ps1
![image](https://github.com/Atman-Shastri/WSL_Ubuntu_20.04_with_ns3_all_in_one/assets/126988436/5a40ea0a-f37b-4c23-8d13-861c106f3e1f)


- Download size is 1.82 gb, and the OS will reside in C:\TIMSCDR-Ubuntu-20.04, consuming 7 gb storage space
- The password for the OS is the same as students use in lab: "mca@123"

- If the script fails to download, alternatively you can download the OS from here:
- https://drive.google.com/file/d/1by4Ou977Wtm0I5OFzQRX1vBx1Fs283re/view?usp=drive_link
- Make a folder named `temporary` in C: drive and store the 1.82gb file there before running the Only_Install script
- Mail me at atmanshastri@gmail.com if any issues or queries
