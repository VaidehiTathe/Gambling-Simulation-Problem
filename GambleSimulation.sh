<<<<<<< HEAD


#CONSTANTS FOR THE PROGRAMM
stakeAMT=100
betAMT=1
win=1
loose=0

#VARIABLES
totalbetWinAmt=0
totalbetLooseAmt=0
=======
#CONSTANTS FOR THE PROGRAMM
stakeAMT=100
betAMT=1
totalAmt=$((stakeAMT))
allDaysCOllection=0
>>>>>>> UC4_calculatingAmountFor20Days

percent=$(((stakeAMT*50)/100))
echo "percentage:"$percent

max=$((percent+stakeAMT))
min=$((stakeAMT-percent))

<<<<<<< HEAD

while [[ $totalbetWinAmt -lt $max && $totalbetLooseAmt -lt $min ]]
do
betCheck=$(($RANDOM%2));
case $betCheck in
  $win)
      betAMT=1  totalbetWinAmt=$(( $totalbetWinAmt + 1 ))
         ;;
  $loose)
       betAMT=1  totalbetLooseAmt=$(( $totalbetLooseAmt + 1 ))
        ;;
esac
echo "winning amt is:" $totalbetWinAmt
echo "Loosing amount is:"$totalbetLooseAmt
done
echo "Total winning amount:" $(($totalbetWinAmt + $stakeAMT))
echo "total loosing amount is:" $(($totalbetLooseAmt + $stakeAMT))

=======
declare -A collectionPerDay
totalDays=20
stakeForTwentyDays=$(($stakeAMT*$totalDays))


for(( day=1; day<=$totalDays; day++ ))
do

	while [[ $totalAmt -le $max && $totalAmt -ge $min ]]
	do
		betCheck=$(($RANDOM%2));
		if [[ $betCheck -eq 1 ]]
		then
			((totalAmt++))
		else
			((totalAmt--))
		fi
	done
	collectionPerDay[$day]=$((totalAmt))
	allDaysCollection=$(($allDaysCollection+$totalAmt))
	totalAmt=$(($stakeAMT))
done
echo "Collection dict is:" ${collectionPerDay[@]}
echo "All day Collection is:"$allDaysCollection

if [[ $allDaysCollection -gt $stakeForTwentyDays ]]
then
	winBy=`expr $allDaysCollection - $stakeForTwentyDays`
	echo "Gambler win by:"$winBy
else
	looseBy=`expr $stakeForTwentyDays - $allDaysCollection`
	echo "Gambler loose by:" $looseBy
fi
>>>>>>> UC4_calculatingAmountFor20Days
