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

# Set the names of the Active Directory groups to add the user to
$groups = @("Sales", "Marketing")

# Create the new user account
New-ADUser -Name $displayName -GivenName $firstName -Surname $lastName -EmailAddress $emailAddress -SamAccountName $username -AccountPassword (ConvertTo-SecureString $password -AsPlainText -Force) -Enabled $true -Path "OU=Users,DC=example,DC=com"

# Add the user to the specified groups
foreach ($group in $groups) {
    Add-ADGroupMember -Identity $group -Members $username
}

# Output a message to confirm the user was created successfully
Write-Output "User $username was created successfully and added to the following groups: $groups"