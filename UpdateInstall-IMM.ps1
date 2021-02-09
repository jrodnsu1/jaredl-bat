#Copy Files from the networ share to the server
$Source = "\\cnm-fs1\data\users\jared\SouthLouisianaBank"
$Destination = "c:\admin\"
New-Item -ItemType directory -path $Destination -force
Copy-Item -Path $Source\ -Destination $Destination -Recurse -force

#Check for Software
$Installed=@(gp "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*").DisplayName
if ($Installed -contains "eSign Client"){ 

#Running the updater command
Start-process -filePath "$env:systemroot\system32\msiexec.exe" -argumentlist '/i "C:\admin\SouthLouisianaBank\eSign_Client_v2020_1_4\eSign Client.msi" /qn /norestart' -wait


}else{

#Running the Newest update
Start-process -filePath "$env:systemroot\system32\msiexec.exe" -argumentlist '/i "C:\admin\SouthLouisianaBank\eSign_Client_v2020_1_4\eSign Client.msi" /qn TEAURL="https://immesign.com/TEAASP/Login.aspx" ACROBATINSTALLCHECK="1" SIGPLUSINSTALL="1" CAMERASUPPORTINSTALL="0" ESIGNSCANNERINSTALL="1"' -wait

}

#Updating Permissions
ICACLS "C:\Program Files (x86)\IMM" /grant ("Users" + ':(OI)(CI)F') /T