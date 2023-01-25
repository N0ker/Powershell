# Import the Active Directory module
Import-Module ActiveDirectory

# Prompt for user input
$firstName = Read-Host "Enter the user's first name"
$lastName = Read-Host "Enter the user's last name"
$userName = Read-Host "Enter the user's username"
$password = Read-Host "Enter the user's password" -AsSecureString
$domain = Read-Host "Enter the domain this user will belong to"

$displayName = "$firstName $lastName"
$emailAddress = "$'firstName + $lastName'@$domain.com"

# Set the names of the Active Directory groups to add the user to
$groups = @("Sales", "Marketing")

try {
    # Create the new user account
    New-ADUser -Name $displayName -GivenName $firstName -Surname $lastName -EmailAddress $emailAddress -SamAccountName $username -AccountPassword (ConvertTo-SecureString $password -AsPlainText -Force) -Enabled $true -Path "OU=Users,DC=example,DC=com"

    # Add the user to the specified groups
    foreach ($group in $groups) {
        Add-ADGroupMember -Identity $group -Members $username
    }

    # Output a message to confirm the user was created successfully
    Write-Output "User $username was created successfully and added to the following groups: $groups"
}
catch {
    # Output an error message if the user account or group membership operations fail
    Write-Error "An error occurred while creating user $username or adding the user to the specified groups. The error message is: $_"
}
