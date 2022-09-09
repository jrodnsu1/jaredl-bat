#Copy Files from the network share to the server
$Source1 = "\\inv-data\data\Installers\HorizonXE\Sigpad\Gemview_tablet\"
$Destination1 = "c:\windows\temp"
New-Item -ItemType directory -path $Destination1 -force
Copy-Item -Path $Source1\ -Destination $Destination1 -Recurse -force

#Install Software

#Running the installers
Start-process -wait -filePath "c:\windows\temp\Gemview_tablet\SigPlusExtLite.exe" -ArgumentList '/S','/v', '/qn' -PassThru | write-output
Start-process -filePath "$env:systemroot\system32\msiexec.exe" -argumentlist '/i "c:\windows\temp\Gemview_tablet\SigPlusOCXWin32_GVA.msi" /qn /norestart' -wait
Start-process -wait -filePath "c:\windows\temp\Gemview_tablet\gemview.exe" -ArgumentList '/S','/sps','/v','/qn' -PassThru | write-output


#Copy Files from the network share to the server
$Source2 = "\\inv-data\data\Installers\HorizonXE\5-Device Agent\Device Agent settings\production xml\XE Device Agent"
$Destination2 = "C:\ProgramData\FIS"
New-Item -ItemType directory -path $Destination2 -force
Copy-Item -Path $Source2\ -Destination $Destination2 -Recurse -force


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
