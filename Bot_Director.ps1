function OS-and-USER-Finder {
    $OS = (Get-ComputerInfo).OsName
If ($OS -like "*Windows*") {$env:USERNAME = $username #If Windows via PowerShell
}elseif ($OS -like "*Linux*" -or $OS -like "*Mac*") #If Linux via Powershell or Mac:
{$env:USER = $username}
} else { $username = "Unknown User (Via Unknown OS)" 
OS-and-USER-Finder
Write-Output "Hello there $username!"
Write-Output "And your on $OS"
Write-Output "What would you like to do?"
$CommandEntered = Read-Host "Available commands include: 'Talk to someone' 'Write Me!'"

if ($CommandEntered -eq "Talk to someone") {
    $Talk_to_someone__ScriptPath = "/var/home/matthew/Code/Powershell/Fun_Bots/Conversation.ps1"
    & $Talk_to_someone__ScriptPath
}
elseif ($CommandEntered -eq "Write Me!") {
    $Write_Me_ScriptPath = "/var/home/matthew/Code/Powershell/Fun_Bots/WriteMe.ps1"
    & $Write_Me_ScriptPath
}
