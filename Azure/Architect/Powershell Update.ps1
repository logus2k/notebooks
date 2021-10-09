# Check your PowerShell version
$PSVersionTable.PSVersion

# PowerShell script execution policy must be set to remote signed or less restrictive.
# Get-ExecutionPolicy -List can be used to determine the current execution policy
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

# Using the Install-Module cmdlet is the preferred installation method for the Az PowerShell module.
# Install the Az module for the current user only. This is the recommended installation scope.
# This method works the same on Windows, macOS, and Linux platforms.
Install-Module -Name Az -Scope CurrentUser -Repository PSGallery -Force

# Sign in with Azure credentials to start working with Azure Powershell
# After executing this command, a new browser window pops up and you can log into your Azure account
Connect-AzAccount
