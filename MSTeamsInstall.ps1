#.DESCRIPTION'Installs Microsoft Teams in all user mode'#

[CmdletBinding()]
param (
	[Parameter(Mandatory=$true)]
	[string]$TeamsPath

)
   
$url
$url32 = 'https://aka.ms/teams32bitmsi'
$url64 = 'https://aka.ms/teams64bitmsi'

if(!$url){
    if([Environment]::Is64BitOperatingSystem){
        $url = $url64
    }
    else{
        $url = $url32
    }
}

$client = new-object System.Net.WebClient
$client.DownloadFile($url,$TeamsPath) 

$return = Start-Process msiexec.exe -Wait -ArgumentList "/I $TeamsPath /qn /norestart"  -PassThru

if(@(0,3010) -contains $return.ExitCode){
return 'Installed'
}
else{
return 'Error Installing'
}
