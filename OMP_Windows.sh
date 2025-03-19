echo "Now installing Tokyo OhMyPOSH terminal format for Windows PowerShell and WSL."

if [ -n "$SHELL" ];
then
	echo "Non-PowerShell detected..."
		if [ "$WSL_DISTRO_NAME" == "Ubuntu" ];
		then
			echo "A supported version of WSL detected... [$WSL_DISTRO_NAME]"
			USERSHELL=$(echo $SHELL | awk -F'/' '{print $3}')
			if [ "$USERSHELL" == "bash" ];
			then
				echo "Installing OhMyPosh with for BASH..."
				mkdir -p ~/.local/bin/
				curl -s https://ohmyposh.dev/install.sh | bash -s -- -d ~/.local/bin/
				echo "alias oh-my-posh='~/.local/bin/oh-my-posh'" >> ~/.bashrc
				source ~/.bashrc
				#Should skip back down to the end of this nested if/else list
			else
				echo "Your shell is not currently supported..."
				echo "Closing script..."
				exit
			fi
		else
			echo "Your product is not supported..."
			echo "Closing script..."
			exit
		fi
else
	echo "Currently using PowerShell..."
	winget install JanDeDobbeleer.OhMyPosh -s winget
	$POWERUSER = (Get-Location).Path -split '\\' | Select-Object -Index 2
	$env:Path += ";C:\Users\$POWERUSER\AppData\Local\Programs\oh-my-posh\bin"
fi

echo "Installing Hack Nerd Font..."
oh-my-posh font install hack

if [ "$USERSHELL" == "bash" ];
then
	echo "eval \"\$(oh-my-posh init bash --config ~/.cache/oh-my-posh/themes/tokyo.omp.json)\"" >> ~/.bashrc
	source ~/.bashrc
else
	if [ -n "$PROFILE" ];
	then
		New-Item -Path $PROFILE -Type File -Force
	fi
	Add-Content -Path $PROFILE -Value "`r`noh-my-posh init pwsh --config C:\Users\$POWERUSER\AppData\Local\Programs\oh-my-posh\bin\tokyo.omp.json | Invoke-Expression"
	. $PROFILE
fi

echo "Tokyo Theme for Oh-My-Posh installed."
echo "Thank you for using my script."
