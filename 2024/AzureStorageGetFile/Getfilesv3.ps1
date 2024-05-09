

Connect-AzAccount -Tenant TanantId -Subscription SubscriptionId

$resourceGroupName="resourcename"  
$storageAccName="accname"  
$directoryPath="document" 
$container = "container"

Function Getfiles
{
    $ctx=(Get-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $storageAccName).Context  
    $files = Get-AzStorageBlob -Container "document" -Context $ctx  | Where-Object {$_.LastModified -gt "2023-12-04" -and $_.LastModified -lt "2023-12-05"}
    foreach ($file in $files)  
        {  
            write-host -ForegroundColor Yellow $file.Name 
            Get-AzStorageBlobContent -Container "document" -Context $ctx  -Blob $file.Name -Destination "C:\test\test" 
        } 
}

Getfiles