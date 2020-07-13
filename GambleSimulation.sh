

#CONSTANTS FOR THE PROGRAMM
stakeAMT=100
betAMT=1
win=1
loose=0

#VARIABLES
totalAmt=$stakeAMT

percent=$(((stakeAMT*50)/100))
echo "percentage:"$percent

max=$((percent+stakeAMT))
min=$((stakeAMT-percent))


while [[ $totalAmt -le $max && $totalAmt -ge $min ]]
do
	betCheck=$(($RANDOM%2));
	if [[ $betCheck -eq $win ]]
	then
		totalAmt=$(( $totalAmt + $betAMT ))
	else
		totalAmt=$(( $totalAmt - $betAMT))
	fi
done
echo "amount:" $totalAmt

