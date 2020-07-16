#CONSTANTS FOR THE PROGRAMM
STAKEAMT=100
BETAMT=1
WIN=1
LOOSE=0

#VARIABLES
totalAmt=$STAKEAMT

percent=$(((STAKEAMT*50)/100))
echo "percentage:"$percent

max=$((percent+STAKEAMT))
min=$((STAKEAMT-percent))


while [[ $totalAmt -le $max && $totalAmt -ge $min ]]
do
	betCheck=$(($RANDOM%2));
	if [[ $betCheck -eq $WIN ]]
	then
		totalAmt=$(( $totalAmt + $BETAMT ))
	else
		totalAmt=$(( $totalAmt - $BETAMT))
	fi
done
echo "amount:" $totalAmt

