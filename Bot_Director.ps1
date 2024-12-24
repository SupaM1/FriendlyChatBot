function Find-OSAndUser {
    # Initialize variables to detect the operating system
    $IsWindowsOS = $false
    $IsLinuxOS = $false
    $IsMacOSPlatform = $false

    # Detect the operating system
    if ($PSVersionTable.PSVersion.Major -ge 6) {
        $IsWindowsOS = [System.Runtime.InteropServices.RuntimeInformation]::IsOSPlatform([System.Runtime.InteropServices.OSPlatform]::Windows)
        $IsLinuxOS = [System.Runtime.InteropServices.RuntimeInformation]::IsOSPlatform([System.Runtime.InteropServices.OSPlatform]::Linux)
        $IsMacOSPlatform = [System.Runtime.InteropServices.RuntimeInformation]::IsOSPlatform([System.Runtime.InteropServices.OSPlatform]::OSX)
    } else {
        $IsWindowsOS = $true
    }

    # Set OS and username based on the detected operating system
    if ($IsWindowsOS) {
        $OS = (Get-WmiObject -Class Win32_OperatingSystem).Caption
        $username = $env:USERNAME
    } elseif ($IsLinuxOS -or $IsMacOSPlatform) {
        $OS = (uname -s)
        if ($OS -eq "Darwin") {
            $OS = "macOS"
        }
        $username = $env:USER
    } else {
        $OS = "Unknown"
        $username = "Unknown"
    }

    # Return the OS and username
    return @{ OS = $OS; Username = $username }
}

# Call the function to find the OS and user
$result = Find-OSAndUser
$OS = $result.OS
$username = $result.Username

# Output the greeting and OS information
Write-Output "Hello there $username!"
Write-Output "And you're on $OS"
Write-Output "What would you like to do?"

# Get the user's command input
$CommandEntered = Read-Host "Available commands include: 'Talk to someone' 'Write Me!'"

# Execute the appropriate script based on the user's command
if ($CommandEntered -eq "Talk to someone") {
    $Talk_to_someone__ScriptPath = "./Conversation.ps1"
    & $Talk_to_someone__ScriptPath
} elseif ($CommandEntered -eq "Write Me!") {
    $Write_Me_ScriptPath = "./Output.ps1"
    & $Write_Me_ScriptPath
}