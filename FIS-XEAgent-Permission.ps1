#Check for folder existence 
$folder = 'c:\ProgramData\FIS' 
if (Test-path -Path $folder){ 

#Folder exist copy xe device agent
#Copy Files from the network share to the server
$Source2 = "\\inv-data\data\Installers\HorizonXE\5-Device Agent\Device Agent settings\production xml\XE Device Agent"
$Destination2 = "C:\ProgramData\FIS"
New-Item -ItemType directory -path $Destination2 -force
Copy-Item -Path $Source2\ -Destination $Destination2 -Recurse -force

#Updating Permissions
ICACLS "C:\ProgramData\FIS" /grant ("Authenticated Users" + ':(OI)(CI)F') /T

}else{

#Create fis folder then copy 
New-Item -Path 'C:\ProgramData\FIS' -ItemType Directory
$Source2 = "\\inv-data\data\Installers\HorizonXE\5-Device Agent\Device Agent settings\production xml\XE Device Agent"
$Destination2 = "C:\ProgramData\FIS"
New-Item -ItemType directory -path $Destination2 -force
Copy-Item -Path $Source2\ -Destination $Destination2 -Recurse -force

#Updating Permissions
ICACLS "C:\ProgramData\FIS" /grant ("Authenticated Users" + ':(OI)(CI)F') /T
}
