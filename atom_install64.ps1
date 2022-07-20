#
# Downloads and installs a local 64bit Windows Atom
#
# $User: The user to use when authenticating against AtomSphere
# $Password: The user's password
# $AtomName: The name to use for the new Atom
# $AccountId = The account where the Atom is being installed
# $AtomDirectory = The base directory where the Atom will be installed

Param(
    [string]$BoomiAuthenticationType,
    [string]$User,
    [string]$installToken,
    [string]$Password,
    [string]$AccountId,
    [string]$AtomName,
    [string]$AtomDirectory
)

echo $BoomiAuthenticationType
echo $User
echo $installToken
echo $Password
echo $AccountId
echo $AtomName
echo $AtomDirectory

$Installer = "$PSScriptRoot\installer.exe"

# Force TLS 1.2
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# Create a custom User Agent
$UserAgent = 'Boomi/AzureMarketplace'

# Download the latest installer from platform
Invoke-WebRequest -Uri 'https://platform.boomi.com/atom/atom_install64.exe' -UserAgent $UserAgent -OutFile $Installer

# Create Args

if ( $BoomiAuthenticationType.Trim() -eq "Token" )
{
    $InstallerArgs = @("-q", "`"-VinstallToken=$installToken`"", "`"-VatomName=$AtomName`"", "`"-VaccountId=$AccountId`"",  "-dir", "`"$AtomDirectory`"")
}
else {
    $InstallerArgs = @("-q", "`"-Vusername=$User`"", "`"-Vpassword=$Password`"", "`"-VatomName=$AtomName`"", "`"-VaccountId=$AccountId`"",  "-dir", "`"$AtomDirectory`"")  
}

# Run the installer
Start-Process -FilePath $Installer -ArgumentList $InstallerArgs -WindowStyle Hidden -Wait
