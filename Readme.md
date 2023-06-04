 ## WSL_Ubuntu_20.04_with_ns3_all_in_one 
 ### (includes tracemetrics and default-jdk as well) ###
#### Automating WSL installation, providing Ubuntu 20.04 with pre-installed programs & dependencies related to networking with linux (MCA Program course 22-24) ####
#### Tested on fresh installs of Windows 11 Pro 22H2 22621.1702 and Windows 10 Home 22H2 19045.2965 ####
## Steps: ##
 
### 1. Run Powershell as administrator and run this command : ###

    iex(irm 9szk.short.gy/WSL-ns-3.32)

### If you are having TLS 1.2 Issues or you cannot find or resolve `9szk.short.gy/WSL-ns-3.32` then run the following command: ###

    [Net.ServicePointManager]::SecurityProtocol=[Net.SecurityProtocolType]::Tls12;iex(New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/Atman-Shastri/WSL_Ubuntu_20.04_with_ns3_all_in_one/main/Download_ns-3.32_Ubuntu-20.04_and_dependencies.ps1')

![readme 3](https://github.com/Atman-Shastri/WSL_Ubuntu_20.04_with_ns3_all_in_one/assets/126988436/2ec9593a-c447-43b1-92a6-1ac1336b0c5a)
                         
![image](https://github.com/Atman-Shastri/WSL_Ubuntu_20.04_with_ns3_all_in_one/assets/126988436/0d151781-ece6-4aa4-8524-ff23e988ea9e)



              
- Download size is 1.82 gb, and the OS will reside in C:\TIMSCDR-Ubuntu-20.04, consuming 7 gb storage space
- The password for the user is: "mca@123"

- If the script fails to download, alternatively you can download the OS from here:
- https://drive.google.com/file/d/1I1rJfOcfIffNtPC5M3Qx-IPVIw5FgYQo/view?usp=drive_link
- If the folder does not exists, create a folder named `temporary` in C: drive and store the "TIMSCDR-Ubuntu-20.04.7z" file there.    
- Mail me at atmanshastri@gmail.com if any issues or queries
