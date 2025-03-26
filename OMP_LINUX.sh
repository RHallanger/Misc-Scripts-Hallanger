echo "Now installing Tokyo OhMyPOSH terminal format."
mkdir -p ~/.local/bin/

USHELL=$(echo $SHELL | awk -F'/' '{print $2}')
INC=0

#This while loop will search the SHELL env var path until it lands on Z Shell or BASH with up to 10 directories in path.
while [ $USHELL != "zsh" ] || [ $USHELL != "bash" ] || [ $INC -le 10 ];
do
	USHELL=$(echo $SHELL | awk -F'/' '{print $i}')
	echo "$USHELL $INC"
	INC=$((INC + 1))
done

#If the shell check was performed but the increment is or exceeds 10 it will close the program.
if [ $INC -ge 10 ];
then
	echo "Your shell is not supported."
	echo "Closing the program..."
	exit 0
fi

#Installs OMP into BASH or ZSH atm
if [ $USHELL == "bash" ];
then
	echo "BASH detected..."
	curl -s https://ohmyposh.dev/install.sh | bash -s -- -d ~/.local/bin/
	echo "alias oh-my-posh='~/.local/bin/oh-my-posh'" >> ~/.bashrc
	echo "OhMyPOSH has been aliased into .bashrc"
	source ~/.bashrc
	echo "OhMyPOSH has been initialized into BASH."
elif [ $USHELL == "zsh" ];
then
	echo "Z Shell detected..."
	curl -s https://ohmyposh.dev/install.sh | zsh -s -- -d ~/.local/bin
	echo "alias oh-my-posh='~/.local/bin/oh-my-posh'" >> ~/.zshrc
	echo "OhMyPosh has been aliased into .zshrc"
	source ~/.zshrc
	echo "OhMyPosh has been aliased into Z Shell."
else
	echo "ERROR: 000001 - SHELL CHECK BYPASSED!!!!!" >> ~/ompscript.log
	exit 1
fi

echo "Installing the HACK Nerd Font..."
oh-my-posh font install hack

if [ $USHELL == "bash" ];
then
	echo "BASH detected..."
	echo "eval \"\$(oh-my-posh init bash --config ~/.cache/oh-my-posh/themes/tokyo.omp.json)\"" >> ~/.bashrc
	source ~/.bashrc
elif [ $USHELL == "zsh" ];
	echo "ZSH detected..."
	echo "eval \"\$(oh-my-posh init bash --config ~/.cache/oh-my-posh/themes/tokyo.omp.json)\"" >> ~/.zshrc
	source ~/.zshrc
else
	echo "ERROR: 000002 EVAL BYPASS!!!!!" >> ~/ompscript.log
	exit 2
fi

echo "OhMyPOSH successfully installed..."
exit 3
