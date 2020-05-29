$username = "PRO\administrateur"
$password = "admin123$"

$pathToInstallFolder = "c:\PRO\PRO.exe"
$pathToApp = "\\PRO-SRV\Shared_APP\PRO.exe"

if (!(Test-Path $pathToInstallFolder -PathType leaf))
{

    New-Item -Path "c:\" -Name "PRO" -ItemType directory -Force
    Copy-Item -Path $pathToApp -Destination "c:\PRO\" -Force

}

$credentials = New-Object System.Management.Automation.PSCredential -ArgumentList @($username,(ConvertTo-SecureString -String $password -AsPlainText -Force))
Start-Process -FilePath $pathToInstallFolder -ArgumentList "client 192.168.0.1" -Credential $credentials

