# Import the Active Directory module
Import-Module ActiveDirectory

# Set the username and password for the new user
$username = "JohnDoe"
$password = "Pa$$w0rd"

# Set the name and other details for the new user
$firstName = "John"
$lastName = "Doe"
$displayName = "$firstName $lastName"
$emailAddress = "johndoe@example.com"

# Create the new user account
New-ADUser -Name $displayName -GivenName $firstName -Surname $lastName -EmailAddress $emailAddress -SamAccountName $username -AccountPassword (ConvertTo-SecureString $password -AsPlainText -Force) -Enabled $true