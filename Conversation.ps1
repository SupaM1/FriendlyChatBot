# Try to get the username from different environment variables
$username = $env:USERNAME
if (-not $username) {
    $username = $env:USER
}
if (-not $username) {
    $username = "User"
}

# Choose $BotName
$PossibleBotNames = @("Very_Helpfull_bot ;)", "I'm so funny", "Real_Genius")
$BotName = $PossibleBotNames | Get-Random

# Define the loading screen function
function Show-LoadingScreen {
    param (
        [int]$duration = 5,  # Duration in seconds
        [int]$interval = 1   # Interval between dots in seconds
    )

    $endTime = (Get-Date).AddSeconds($duration)
    while ((Get-Date) -lt $endTime) {
        Write-Host -NoNewline "."
        Start-Sleep -Seconds $interval
    }
    Write-Host  # Move to the next line after loading is complete
}

# Greeting Prompt
$promptMessage1 = "$($BotName): My name is $($BotName) (in case you haven't noticed.)"
$promptMessage2 = "$($BotName): Your name is $($username), isn't it?! I haven't been calling you the wrong name! Have I?! If I am, just let me know by saying, 'I'm not $($username)!' If not, I'll assume you are $($username). :)"
Write-Output $promptMessage1
Show-LoadingScreen -duration 3 -interval 1
Write-Output $promptMessage2

# Define the Set-Username function
function Set-Username {
    $newUsername = Read-Host "Okay fussy, please enter your correct username"
    $script:username = $newUsername
    Write-Output "Your Username has been changed to $($username)"
}

# Function to prompt the user for input
function Show-UserPrompt {
    param (
        [string]$prompt
    )
    return Read-Host $prompt
}

# Prompt the user for input
$userResponse = Show-UserPrompt "Your response"

# Check if the user wants to change their username
if ($userResponse -like "I'm not $username*") {
    Set-Username
}

# Continue with the rest of the script using the updated username
Write-Output "$($BotName): Nice to meet you, $username!"
Show-LoadingScreen -duration 2 -interval 1
Write-Output "What now?"
