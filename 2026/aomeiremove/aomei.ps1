# Run PowerShell as Administrator

# Get current system PATH
$oldPath = [Environment]::GetEnvironmentVariable('Path', 'Machine')

# Remove all AOMEI references
$newPath = ($oldPath -split ';' | Where-Object {
    $_ -notmatch 'AOMEI' -and 
    $_ -notmatch '\\AOMEI Backupper\\'
}) -join ';'

# Update PATH
[Environment]::SetEnvironmentVariable('Path', $newPath, 'Machine')

# Also clean user PATH
$oldUserPath = [Environment]::GetEnvironmentVariable('Path', 'User')
$newUserPath = ($oldUserPath -split ';' | Where-Object {
    $_ -notmatch 'AOMEI'
}) -join ';'
[Environment]::SetEnvironmentVariable('Path', $newUserPath, 'User')