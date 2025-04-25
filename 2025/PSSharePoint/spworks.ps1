# Import the SharePoint Online Management Shell module
Import-Module Microsoft.Online.SharePoint.PowerShell

# Define the SharePoint site URL and credentials
$siteUrl = "https://someone.sharepoint.com/Devsite"
$username = "someone@someone.onmicrosoft.com"
$password = "password"

# Convert the password to a secure string
$securePassword = ConvertTo-SecureString $password -AsPlainText -Force

# Create the SharePoint Online credentials object
$credentials = New-Object Microsoft.SharePoint.Client.SharePointOnlineCredentials($username, $securePassword)

# Connect to the SharePoint site
$context = New-Object Microsoft.SharePoint.Client.ClientContext($siteUrl)
$context.Credentials = $credentials

# Define the list name and item ID
$listName = "TestList"
$itemId = 1

# Retrieve the item from the list
$list = $context.Web.Lists.GetByTitle($listName)
$item = $list.GetItemById($itemId)
$context.Load($item)
$context.ExecuteQuery()

# Display the item properties
$item.FieldValues
