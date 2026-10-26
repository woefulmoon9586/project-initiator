<#
.SYNOPSIS
    Safely renames the project directory (e.g. from '新建文件夹' to a chosen project name) and initializes Git.
.PARAMETER CurrentPath
    The current directory path (defaults to current location).
.PARAMETER NewName
    The new project directory name (e.g. 'omni-note').
.PARAMETER InitGit
    Switch to initialize Git repo.
#>
param(
    [string]$CurrentPath = ".",
    [Parameter(Mandatory=$true)]
    [string]$NewName,
    [switch]$InitGit = $true
)

$resolved = (Resolve-Path $CurrentPath).Path
$parentDir = Split-Path $resolved -Parent
$currentDirName = Split-Path $resolved -Leaf

Write-Host "Current directory: $resolved"
Write-Host "Target name: $NewName"

# 1. Rename directory if needed
$newPath = Join-Path $parentDir $NewName
if ($currentDirName -ne $NewName) {
    if (Test-Path $newPath) {
        Write-Warning "Target path '$newPath' already exists. Skipping rename."
        $finalPath = $newPath
    } else {
        Write-Host "Renaming '$currentDirName' -> '$NewName'..."
        # Step out of directory to avoid locking
        Set-Location $parentDir
        Rename-Item -Path $resolved -NewName $NewName -ErrorAction Stop
        Set-Location $newPath
        $finalPath = $newPath
        Write-Host "[OK] Folder successfully renamed to: $NewName"
    }
} else {
    Write-Host "Folder already matches '$NewName'."
    $finalPath = $resolved
    Set-Location $finalPath
}

# 2. Git initialization if requested
if ($InitGit) {
    if (-not (Test-Path (Join-Path $finalPath ".git"))) {
        Write-Host "Initializing Git repository..."
        git init -b main
        Write-Host "[OK] Git initialized with default branch 'main'."
    } else {
        Write-Host "Git repository already exists."
    }
}

Write-Output @{
    Status = "Success"
    ProjectPath = $finalPath
    ProjectName = $NewName
} | ConvertTo-Json
