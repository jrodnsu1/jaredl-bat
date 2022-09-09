#Copy Files from the network share to the server
copy-item -path "\\Inv-data\data\Installers\HorizonXE\subinacl.msi" -Destination "c:\windows\temp\subinacl.msi"

# Download the file
Invoke-Webrequest -Uri $url -Outfile $dest

#Running the installers
Start-process -filePath "$env:systemroot\system32\msiexec.exe" -argumentlist '/i "c:\windows\temp\subinacl.msi" /qn /norestart' -wait

#Apply Permissions
Start-process -filePath "C:\Program Files (x86)\Windows Resource Kits\Tools\subinacl.exe" -argumentlist '/printer "Generic / Text Only" /Grant=Everyone=F' -wait

$app = Get-WmiObject -Class Win32_Product `
                     -Filter "Name = 'Windows Resource Kit Tools - SubInAcl.exe'"
$app.Uninstall()
