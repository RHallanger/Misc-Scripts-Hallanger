echo "Now installing Tokyo OhMyPOSH terminal format."
mkdir -p ~/.local/bin/

USHELL=none
INC=0

#This while loop will search the SHELL env var path until it lands on Z Shell or BASH with up to 10 directories in path.
while (([ "$USHELL" != "zsh" ] && [ "$USHELL" != "bash" ]) && [ "$INC" -le "9" ]);
do
	USHELL=$(echo $SHELL | awk -F'/' -v increment=$INC '{print $increment}')
	echo "USHELL: $USHELL | Loop Count: $INC"
	INC=$((INC + 1))
done

#If the shell check was performed but the increment is or exceeds 10 it will close the program.
if [ "$INC" -ge "10" ];
then
	echo "Your shell is not supported."
	echo "Closing the program..."
	exit 0
fi

#Installs OMP into BASH or ZSH atm
if [ "$USHELL" == "bash" ];
then
	echo "BASH detected..."
	curl -s https://ohmyposh.dev/install.sh | bash -s -- -d ~/.local/bin/
	echo "alias oh-my-posh='~/.local/bin/oh-my-posh'" >> ~/.bashrc
	echo "OhMyPOSH has been aliased into .bashrc"
	source ~/.bashrc
	. ~/.bashrc
	echo "OhMyPOSH has been initialized into BASH."
	wait
elif [ "$USHELL" == "zsh" ];
then
	echo "Z Shell detected..."
	curl -s https://ohmyposh.dev/install.sh | zsh -s -- -d ~/.local/bin
	echo "alias oh-my-posh='~/.local/bin/oh-my-posh'" >> ~/.zshrc
	echo "OhMyPosh has been aliased into .zshrc"
	source ~/.zshrc
	. ~/.zshrc
	echo "OhMyPosh has been aliased into Z Shell."
	wait
fi

echo "Installing the HACK Nerd Font..."
echo "If there is a missing oh-my-posh command error, please use <bash -i OMP_LINUX.sh>."
oh-my-posh font install hack
wait

if [ "$USHELL" == "bash" ];
then
	echo "BASH detected..."
	echo "eval \"\$(oh-my-posh init bash --config ~/.cache/oh-my-posh/themes/tokyo.omp.json)\"" >> ~/.bashrc
	source ~/.bashrc
	. ~/.bashrc
	wait
elif [ "$USHELL" == "zsh" ];
then
	echo "ZSH detected..."
	echo "eval \"\$(oh-my-posh init bash --config ~/.cache/oh-my-posh/themes/tokyo.omp.json)\"" >> ~/.zshrc
	source ~/.zshrc
	. ~/.zshrc
	wait
fi

echo "OhMyPOSH successfully installed..."
source ~/.bashrc
. ~/.bashrc
wait
exit 3
