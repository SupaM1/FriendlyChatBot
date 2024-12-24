# Try to get the username from different environment variables
$username = $env:USERNAME
if (-not $username) {
    $username = $env:USER
}
if (-not $username) {
    $username = "User"
}

$BotName = "pwsh"
$promptMessage1 = "$($BotName): My name is $($BotName) (in case you haven't noticed.)"
$promptMessage2 = "$($BotName): Your name is $($username), isn't it?! I haven't been calling you the wrong name! Have I?! If I am, just let me know by saying, 'I'm not $($username)!' If not, I'll assume you are $($username). :)"
Write-Output $promptMessage1
Write-Output $promptMessage2

# Define the Change-Username function
function Set-Username {
    $newUsername = Read-Host "Please enter your correct username"
    $global:username = $newUsername
    Write-Output "Username has been changed to $username"
}

# Function to prompt the user for input
function Show-UserPrompt {
    param (
        [string]$prompt
    )
    return Read-Host $prompt
}

# Prompt the user for input
$userResponse = Ask-User "Your response"

# Check if the user wants to change their username
if ($userResponse -like "I'm not $username*") {
    Change-Username
}

# Continue with the rest of the script
Write-Output "$($BotName): Nice to meet you, $username!"
Write-Output "What now?"
