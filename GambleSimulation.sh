
#CONSTANTS FOR THE PROGRAMM
STAKEAMT=100
BETAMT=1
ONE=1
totalAmt=$((STAKEAMT))
allDaysCOllection=0


percent=$(((STAKEAMT*50)/100))

max=$((percent+STAKEAMT))
min=$((STAKEAMT-percent))


declare -A collectionPerDay
totalDays=30
stakeForTwentyDays=$(($STAKEAMT*$totalDays))


for(( day=$ONE; day<=$totalDays; day++ ))
do

	while [[ $totalAmt -le $max && $totalAmt -ge $min ]]
	do
		betCheck=$(($RANDOM%2));
		if [[ $betCheck -eq $ONE ]]
		then
			totalAmt=$(( $totalAmt + $BETAMT ))
		else
			totalAmt=$(( $totalAmt - $BETAMT ))
		fi
	done
	collectionPerDay[$day]=$((totalAmt))
	allDaysCollection=$(($allDaysCollection+$totalAmt))
	totalAmt=$(($STAKEAMT))
done
echo "All day Collection is:"$allDaysCollection

countOfDaysWin=0
countOfDaysLoose=0
function daysWonLoose()
{
	for day in "${!collectionPerDay[@]}"
	do
		if [[ ${collectionPerDay[$day]} -gt $max ]]
		then
			((countOfDaysWin++))
		elif [[ ${collectionPerDay[$day]} -lt $min ]]
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

