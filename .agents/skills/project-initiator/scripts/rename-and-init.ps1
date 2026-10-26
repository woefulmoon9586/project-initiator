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

$ErrorActionPreference = "Continue"

$resolved = (Resolve-Path $CurrentPath).Path
$parentDir = Split-Path $resolved -Parent
$currentDirName = Split-Path $resolved -Leaf

Write-Host "Current directory : $resolved"
Write-Host "Target name       : $NewName"

$renamed = $false
$lockDetected = $false
$finalPath = $resolved
$message = ""

# 1. Rename directory if needed
$newPath = Join-Path $parentDir $NewName

if ($currentDirName -ne $NewName) {
    if (Test-Path $newPath) {
        Write-Warning "Target path '$newPath' already exists. Skipping rename."
        $finalPath = $newPath
        $message = "Target directory '$newPath' already exists. Using existing path."
    } else {
        Write-Host "Attempting to rename '$currentDirName' -> '$NewName'..."
        # Step out of current directory to release PowerShell's own handle
        Set-Location $parentDir
        
        try {
            Rename-Item -Path $resolved -NewName $NewName -ErrorAction Stop
            Set-Location $newPath
            $finalPath = $newPath
            $renamed = $true
            $message = "Folder successfully renamed to: $NewName"
            Write-Host "[OK] $message"
        } catch {
            $lockDetected = $true
            Set-Location $resolved
            $finalPath = $resolved
            $message = "Folder is locked by an active process (such as the IDE workspace). Automatic rename was prevented by Windows."
            Write-Warning "[WARN] $message"
            Write-Warning "Details: $($_.Exception.Message)"
        }
    }
} else {
    Write-Host "Folder already matches '$NewName'."
    $finalPath = $resolved
    $message = "Folder already matches target name."
    Set-Location $finalPath
}

# 2. Git initialization if requested
$gitInitialized = $false
if ($InitGit) {
    if (-not (Test-Path (Join-Path $finalPath ".git"))) {
        Write-Host "Initializing Git repository in '$finalPath'..."
        try {
            git -C $finalPath init -b main | Out-Null
            Write-Host "[OK] Git initialized with default branch 'main'."
            $gitInitialized = $true
        } catch {
            Write-Warning "Git init encountered an issue: $($_.Exception.Message)"
        }
    } else {
        Write-Host "Git repository already exists."
        $gitInitialized = $true
    }
}

$outputObj = [PSCustomObject]@{
    Status          = if ($lockDetected) { "Locked" } else { "Success" }
    Renamed         = $renamed
    LockDetected    = $lockDetected
    ProjectPath     = $finalPath
    ProjectName     = $NewName
    GitInitialized  = $gitInitialized
    Message         = $message
}

Write-Output ($outputObj | ConvertTo-Json -Compress)
