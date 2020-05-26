Import-Module ActiveDirectory
$Users = Import-Csv -Delimiter ";" -Path "C:\Users\Administrateur\Desktop\ListUsers.csv"          
foreach ($User in $Users)            
{            
    $Displayname = $User.FirstName + " " + $User.Lastname            
    $UserFirstname = $User.Firstname            
    $UserLastname = $User.Lastname            
    $OU = $User.OU           
    $SAM = $User.SAM                                 
    $Password = $User.Password       
    New-ADUser -Name $Displayname -DisplayName $Displayname -SamAccountName $SAM -GivenName $UserFirstname -Surname $UserLastname -AccountPassword (ConvertTo-SecureString $Password -AsPlainText -Force) -Enabled $true -Path "$OU" -ChangePasswordAtLogon $false -PasswordNeverExpires $true
    Add-ADGroupMember -Identity $User.Group -Members $SAM
}