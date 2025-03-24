Write-Host "Now installing Tokyo OhMyPOSH terminal format for Windows PowerShell."

if ($env:SHELL) 
{
	Write-Host "You are not currently using powershell..."
	Write-Host "Please use the Linux version of this script for installation."
	Write-Host "Closing script..."
	exit
}
else 
{
	Write-Host "Currently using PowerShell..."
	winget install JanDeDobbeleer.OhMyPosh -s winget
	$POWERUSER = [System.Environment]::UserName
	$env:Path += ";C:\Users\$POWERUSER\AppData\Local\Programs\oh-my-posh\bin"
}

Write-Host "Installing Hack Nerd Font..."
oh-my-posh font install hack

if (!(Test-Path -Path $PROFILE))
{
	New-Item -Path $PROFILE -Type File -Force
}

Add-Content -Path $PROFILE -Value "`r`noh-my-posh init pwsh --config C:\Users\$POWERUSER\AppData\Local\Programs\oh-my-posh\bin\tokyo.omp.json | Invoke-Expression"
. $PROFILE

Write-Host "Tokyo Theme for Oh-My-Posh installed."
Write-Host "Thank you for using my script."