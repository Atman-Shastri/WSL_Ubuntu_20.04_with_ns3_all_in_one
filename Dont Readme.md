 ## WSL_Ubuntu_20.04_with_ns3_all_in_one 
 ### (includes tracemetrics and default-jdk as well) ###
#### Automating WSL installation, providing Ubuntu 20.04 with pre-installed programs & dependencies related to networking with linux (MCA Program course 22-24) ####
#### Tested on fresh installs of Windows 11 Pro 22H2 22621.1702 and Windows 10 Home 22H2 19045.2965 ####
## Steps: ##

### 1. Click on code, download zip and extract it (preferably in D: or E: or where folder paths are shorter): ###

![Readme 1](https://github.com/Atman-Shastri/WSL_Ubuntu_20.04_with_ns3_all_in_one/assets/126988436/df21ab78-96b0-48b6-b9fb-83afc90f1224)
![Readme 2](https://github.com/Atman-Shastri/WSL_Ubuntu_20.04_with_ns3_all_in_one/assets/126988436/48f9ae6a-ce70-4a78-93d0-3877c4bc3cc8)


### 2. Run Powershell as administrator and cd to the directory where the repository folder is extracted/cloned : ###

![readme 3](https://github.com/Atman-Shastri/WSL_Ubuntu_20.04_with_ns3_all_in_one/assets/126988436/2ec9593a-c447-43b1-92a6-1ac1336b0c5a)

### 3. Run this command in Powershell: ###

       powershell.exe -ExecutionPolicy Bypass -File .\Download_ns-3.32_Ubuntu-20.04_and_dependencies.ps1
       iex ((New-Object System.Net.WebClient).DownloadString('https://tinyurl.com/WSL-ns-3-32-Ubuntu-20-04'))
                         
![image](https://github.com/Atman-Shastri/WSL_Ubuntu_20.04_with_ns3_all_in_one/assets/126988436/5a40ea0a-f37b-4c23-8d13-861c106f3e1f)

### After restart, open Powershell as administrator,cd to the directory where the repository folder is, and run this command: ###

       powershell.exe -ExecutionPolicy Bypass -File .\Continue_Installation_after_restart.ps1
              
- Download size is 1.82 gb, and the OS will reside in C:\TIMSCDR-Ubuntu-20.04, consuming 7 gb storage space
- The password for the user is the same as students use in lab: "mca@123"

- If the script fails to download, alternatively you can download the OS from here:
- https://drive.google.com/file/d/1I1rJfOcfIffNtPC5M3Qx-IPVIw5FgYQo/view?usp=drive_link
- If the folder does not exists, create a folder named `temporary` in C: drive and store the 1.82gb file there before running the Only_Install script

      powershell.exe -ExecutionPolicy Bypass -File .\Only_Install_ns-3.32_Ubuntu-20.04.ps1
      iex ((New-Object System.Net.WebClient).DownloadString('https://tinyurl.com/WSL-ns-3-32-Ubuntu-20-04'))
           
- Mail me at atmanshastri@gmail.com if any issues or queries