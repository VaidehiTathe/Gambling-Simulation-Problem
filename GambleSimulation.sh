#CONSTANTS FOR THE PROGRAMM
stakeAMT=100
betAMT=1
win=1
loose=0

#VARIABLES
totalAmt=$((stakeAMT))
totalDays=20
winAMT=0
looseAMT=0

percent=$(((stakeAMT*50)/100))
echo "percentage:"$percent

max=$((percent+stakeAMT))
min=$((stakeAMT-percent))

resign()
{
	while [[ $totalAmt -gt $min && $totalAmt -lt $max ]]
	do
		betCheck=$(($RANDOM%2));
		case $betCheck in
			$win)
      			betAMT=1  totalAmt=$(( $totalAmt + 1 ))
         			;;
  			$loose)
		       	betAMT=1  totalAmt=$(( $totalAmt + 1 ))
        			;;
		esac
	done
}
resign

echo "Total amount is:" $totalAmt

calculateTotalAmount()
{
for (( day=1; day<=$totalDays; day++ ))
do 
	totalAMT=$stakeAMT
	if [ $totalAmt -gt $stakeAMT ]
	then
		winAMt=$(( $totalAmt-$stakeAMT ))
#		echo "total amt is:"$totalAMT
		totalwinAMT=$(( $totalwinAMT + $winAMT))
	else
		looseAMT=$(( $stakeAMT-$totalAMT ))
	fi
done
}
calculateTotalAmount
echo "Winning amount is:" $totalwinAMT
echo "Loosing amount is:" $looseAMT
