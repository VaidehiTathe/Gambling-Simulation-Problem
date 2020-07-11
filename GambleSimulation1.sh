#CONSTANTS FOR THE PROGRAMM
stakeAMT=100
betAMT=1
totalAmt=$((stakeAMT))
allDaysCOllection=0

percent=$(((stakeAMT*50)/100))
echo "percentage:"$percent

max=$((percent+stakeAMT))
min=$((stakeAMT-percent))

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
