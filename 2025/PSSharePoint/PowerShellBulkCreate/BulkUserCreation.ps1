# Run this script as Administrator

# Path to the text file containing usernames (one per line)
$UserFile = "C:\temp\users.txt"

# Default password for all users
$DefaultPasswordPlain = "Server!2022"
$Password = ConvertTo-SecureString $DefaultPasswordPlain -AsPlainText -Force

# Check if the file exists
if (-Not (Test-Path $UserFile)) {
    Write-Error "File not found: $UserFile"
    exit
}

# Read all usernames from the file, trim whitespace, and skip empty lines
$Usernames = Get-Content -Path $UserFile | ForEach-Object { $_.Trim() } | Where-Object { $_ -ne "" }

# Loop through each username and create the local user
foreach ($Username in $Usernames) {
    try {
        # Check if user already exists
        if (Get-LocalUser -Name $Username -ErrorAction SilentlyContinue) {
            Write-Warning "User '$Username' already exists. Skipping."
            continue
        }

        # Create the new local user
        New-LocalUser -Name $Username `
                      -Password $Password `
                      -FullName $Username `
                      -Description "Created via bulk script on $(Get-Date -Format 'yyyy-MM-dd')" `
                      -PasswordNeverExpires

        Write-Host "Successfully created user: $Username" -ForegroundColor Green
    }
    catch {
        Write-Error "Failed to create user '$Username': $_"
    }
}

Write-Host "Bulk user creation completed." -ForegroundColor Cyan