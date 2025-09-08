read -p "Level (0-34): " gameLevel
echo "Loading level [$gameLevel]."
ssh bandit$gameLevel@bandit.labs.overthewire.org -p 2220
