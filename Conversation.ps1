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

function Change-Username {
    param (
        [string]$ChangeName
    )
    $promptMessage3 = "Okay, If you don't like being called $($username), then I'll call you something else."
    Write-Output $promptMessage3
    $username = Read-Host "Okay, what do you want to be called?"
    $promptMessage4 = "Hello there $($username)!"
    $promptMessage5 = "Glad we got that settled!"
    $promptMessage6 = "Since you're so fussy, I thought I'd say if you don't like being called $username, just let me know again."
    Write-Output $promptMessage4
    Write-Output $promptMessage5
    Write-Output $promptMessage6
}

# Function to prompt the user for input
function Ask-User {
    param (
        [string]$message
    )
    return Read-Host $message
}

# Prompt the user for input
$userResponse = Ask-User "Your response"

# Check if the user wants to change their username
if ($userResponse -eq "I'm not $username!") {
    Change-Username -ChangeName $userResponse
} else {
    $promptMessage7 = "Great! I will continue calling you $($username)."
    Write-Output $promptMessage7
}
Write-Output "What now?"
