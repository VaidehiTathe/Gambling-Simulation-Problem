
echo "Welcome to Gambling Game"
#Declaring Variables
stakeAmt=100
betAMT=1
win=1
loose=0

random=$((RANDOM%2))


if [[ $random -eq $WIN ]]
then
	echo "You Win $"$betAMT
else
	echo "You loose $"$betAMT
fi
