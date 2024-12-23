function Output {
    $output = Read-Host "What would you like your output to be?"
    Write-Output $output
}

do {
    Output
    $again = Read-Host "again? (Y/N/Other)"
    switch ($again) {
        "Y" {
            # Continue the loop
            Write-Output "Continuing..."
        }
        "N" {
            # Exit the loop
            Write-Output "Exiting..."
            break
        }
        default {
            # Handle other input
            $Exited_or_Exited = Get-Random -Minimum 1 -Maximum 3
            if ($Exited_or_Exited -eq 1) {
                Write-Output "You entered something else. Exiting..."
                break
            } elseif ($Exited_or_Exited -eq 2) {
                Write-Output "Huh?"
                $again = Read-Host "Soooo....... Again?..........."
            } else {
                Write-Output "Unexpected input. Exiting..."
                break
            }
        }
    }
} while ($true)
