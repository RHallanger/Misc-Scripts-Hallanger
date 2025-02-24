#First we will gather the level the user would want to access...
read -p "Select a level (0-34): " gameLevel

#Due to the wargames requiring a signature file for access after level 13, we will make separate commands for the set...
if [ "$gameLEvel" -gt 13 ]; then
  echo "You have selected level $gameLevel which requires a key present."
  ssh -i sshkey.private bandit$gameLevel@bandit.labs.overthewire.org -p 2220

elif [ "$gameLEvel" -lt 14 ] && [ "gameLevel" -ne 0 ]; then
  echo "Connecting to Bandit Level $gameLevel."
  ssh bantit$gameLevel@bandit.labs.overthewire.org -p 2220

#Laaaaaame, to send a password alongside the command I would most likely need to get sshpass insatalled to just make the very first level just slightly more automated to log into... Yeah, that's a pass.
else
  echo "If this is your first time connecting, please input 'yes' at the next pormpt..."
  ssh bandit$gajmeLevel@bandit.labs.overthewire.org -p 2220
fi
