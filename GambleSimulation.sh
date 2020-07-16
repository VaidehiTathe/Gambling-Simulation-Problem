
#CONSTANTS FOR THE PROGRAMM
STAKEAMT=100
BETAMT=1
ONE=1
totalAmt=$((STAKEAMT))
allDaysCOllection=0

#VARIABLES FOR FUNCTIONS
countOfDaysWin=0
countOfDaysLoose=0
declare -a luckyDays
counterOfLuckyDays=0
declare -a unluckyDays
counterOfUnluckyDays=0


percent=$(((STAKEAMT*50)/100))
echo "percentage:"$percent

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
		if [[ $betCheck -eq 1 ]]
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

function daysWonLoose()
{
	for day in "${!collectionPerDay[@]}"
	do
		if [[ ${collectionPerDay[$day]} -gt $max ]]
		then
			((countOfDaysWin++))
			luckyDays[((counterOfLuckyDays++))]=$day
		elif [[ ${collectionPerDay[$day]} -lt $min ]]
		then
			((countOfDaysLoose++))
			unluckyDays[((counterOfUnluckyDays++))]=$day
		else
			echo "tie"
		fi
	done
	echo "Count of days gambler won the game is:" $countOfDaysWin
	echo "Luckiest days of gambler is:" ${luckyDays[@]}
	echo "Count of days gambler loose the game is:" $countOfDaysLoose
	echo "Unluckiest days of gambler is:" ${unluckyDays[@]}
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

