# Run as Administrator

# Define the folder to share
$FolderPath = "C:\shared"

# Share name (how it will appear on the network)
$ShareName = "shared"

# Description (optional)
$Description = "Read-only shared folder"

# Check if the folder exists; create it if it doesn't
if (-Not (Test-Path $FolderPath)) {
    New-Item -Path $FolderPath -ItemType Directory | Out-Null
    Write-Host "Created folder: $FolderPath" -ForegroundColor Yellow
}

# Share the folder with Read permission for Everyone
try {
    # Remove the share if it already exists (to avoid conflicts)
    if (Get-SmbShare -Name $ShareName -ErrorAction SilentlyContinue) {
        Remove-SmbShare -Name $ShareName -Force
        Write-Host "Existing share '$ShareName' removed." -ForegroundColor Yellow
    }

    # Create the new share with Read permission for Everyone
    New-SmbShare -Name $ShareName `
                 -Path $FolderPath `
                 -Description $Description `
                 -ReadAccess "Everyone" `
                 -FullAccess "Administrators"  # Optional: keep full control for admins

    Write-Host "Folder '$FolderPath' successfully shared as '\\$(hostname)\$ShareName' with read-only access for Everyone." -ForegroundColor Green
}
catch {
    Write-Error "Failed to create share: $_"
}

# Optional: Verify the share was created
Get-SmbShare -Name $ShareName | Format-List Name, Path, Description, ShareState