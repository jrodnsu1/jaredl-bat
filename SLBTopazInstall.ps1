#Copy Files from the network share to the server
$Source1 = "\\Slb-dc1\installs\CSI\Topaz Signature Pads w DemoOCX"
$Destination1 = "c:\windows\temp"
New-Item -ItemType directory -path $Destination1 -force
Copy-Item -Path $Source1\ -Destination $Destination1 -Recurse -force

#Install Software

#Running the installers
Start-process -wait -filePath "c:\windows\temp\SigPlusExtLite.exe" -ArgumentList '/S','/v', '/qn' -PassThru | write-output
Start-process -wait -filePath "c:\windows\temp\sigplus.exe" -ArgumentList '/S','/sps','/v','/qn' -PassThru | write-output
