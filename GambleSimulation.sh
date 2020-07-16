echo "Welcome to Gambling Game"
#Declaring Variables
STAKEAMT=100
BETAMT=1
WIN=1
LOOSE=0

betCheck=$((RANDOM%2))


if [[ $betCheck -eq $WIN ]]
then
	echo "You Win $"$BETAMT
else
	echo "You loose $"$BETAMT
fi
