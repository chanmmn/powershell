Connect-AzAccount -Tenant TenantId -Subscription SubscriptionId 
$resourceGroupName =" resourceGroupName "  
$storageAccName =" storageAccName "  
$directoryPath ="document" 
$container = "container"
$ctx=(Get-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $storageAccName).Context  
Get-AzStorageBlob -Container "document" -Context $ctx  | Where-Object {$_.LastModified -gt "2024-03-15"} 
