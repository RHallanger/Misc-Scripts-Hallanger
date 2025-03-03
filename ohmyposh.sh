echo "Now installing Tokyo OhMyPOSH terminal format."
mkdir -p ~/.local/bin/

if [ "$SHELL" == "/bin/bash" ];
then
	echo "BASH Shell detected..."
	curl -s https://ohmyposh.dev/install.sh | bash -s -- -d ~/.local/bin/
	echo "alias oh-my-posh='~/.local/bin/oh-my-posh'" >> ~/.bashrc
	echo "OhMyPOSH has been aliased into .bashrc"
	source ~/.bashrc
	echo "OhMyPOSH has been initialized into BASH shell."
else
	echo "Your shell is not currently supported... Closing the program."
	exit
fi

echo "Installing the HACK Nerd Font..."

oh-my-posh font install hack

if [ "$WSL_DISTRO_NAME" == "Ubuntu" ];
then
	echo "WSL Ubuntu detected..."
	echo "eval \"\$(oh-my-posh init bash --config ~/.cache/oh-my-posh/themes/tokyo.omp.json)\"" >> ~/.bashrc_test
	source ~/.bashrc
else
	echo "Your distribution is not currently supported... Closing the program."
	exit
fi

echo "OhMyPOSH successfully installed..."
