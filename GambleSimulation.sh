
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
totalDays=30
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
echo "All day Collection is:"$allDaysCollection

countOfDaysWin=0
countOfDaysLoose=0
function daysWonLoose()
{
	echo "Collection of month is:" ${collectionPerDay[@]}

	for i in "${!collectionPerDay[@]}"
	do
		if [[ ${collectionPerDay[$i]} -gt $max ]]
		then
			((countOfDaysWin++))
		elif [[ ${collectionPerDay[$i]} -lt $min ]]
		then
			((countOfDaysLoose++))
		else
			echo "tie"
		fi
	done
	echo "Count of days gambler won the game is:" $countOfDaysWin
	echo "Count of days gambler loose the game is:" $countOfDaysLoose
}
daysWonLoose

if [[ $allDaysCollection -gt $stakeForTwentyDays ]]
then
	winBy=`expr $allDaysCollection - $stakeForTwentyDays`
	echo "Gambler win by:"$winBy
else
	looseBy=`expr $stakeForTwentyDays - $allDaysCollection`
	echo "Gambler loose by:" $looseBy
fi

