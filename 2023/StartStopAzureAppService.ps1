# Install and import the Az module
Install-Module -Name Az -AllowClobber -Scope CurrentUser -Force
Import-Module Az -Force

# Connect to Azure (sign in if not already signed in)
Connect-AzAccount

# Set variables for your Azure subscription and resource group
$subscriptionId = "<YourSubscriptionId>"
$resourceGroupName = "<YourResourceGroupName>"
$appServiceName = "<YourAppServiceName>"

# Select the target subscription
Set-AzContext -SubscriptionId $subscriptionId

# Start the Azure App Service
Start-AzWebApp -ResourceGroupName $resourceGroupName -Name $appServiceName
