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