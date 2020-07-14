#!/bin/bash +x

#CONSTANTS FOR THE PROGRAMM
stakeAMT=100
betAMT=1
totalAmt=$((stakeAMT))
prevDayCollection=$((stakeAMT))


declare -A collectionPerDay
totalDays=5
stakeForTwentyDays=$(($stakeAMT*$totalDays))

#VARIABLES FOR FUNCTIONS daywonloose
countOfDaysWin=0
countOfDaysLoose=0
declare -a luckyDays
counterOfLuckyDays=1
declare -a unluckyDays
counterOfUnluckyDays=0

function play()
{
for(( day=1; day<=$totalDays; day++ ))
do

	
	percent=$(((prevDayCollection*50)/100))
	echo "percentage:"$percent

	max=$((percent+prevDayCollection))
	min=$((prevDayCollection-percent))

        while [[ $prevDayCollection -le $max &&  $prevDayCollection -ge $min ]]
        do
                betCheck=$(($RANDOM%2));
                if [[ $betCheck -eq 1 ]]
                then
                        prevDayCollection=$(( $prevDayCollection + $betAMT ))
                else
                        prevDayCollection=$(( $prevDayCollection - $betAMT ))
                fi
        done
        collectionPerDay[$day]=$((prevDayCollection))
	prevDayCollection=$(($prevDayCollection)) #+$totalAmt
#        allDaysCollection=$(($allDaysCollection+$totalAmt))
        #totalAmt=$(($stakeAMT))
	echo "collection for day $day is:"$prevDayCollection
done
daysWonLoose
}


function choice()
{
        read -p "Enter 1 if want to play:" y
        #echo "valus of user after win is:"$z
        if [[ $y -eq 1 ]]
        then
                play
        else
                echo "Thank you"
                exit
        fi
}


function luckyUnluckyDays()
{
	for days in ${!collectionPerDay[@]}
	do
		for money in ${collectionPerDay[@]}
		do
#			echo "money is:$money"
			luckyDays[((counterOfLuckyDays++))]=$money
#			luckyDays([$days])=$money
		done
		break
	done
	echo "lucky day array is:${!luckyDays[@]}"
	echo "lucky money array is:${luckyDays[@]}"
#	echo "The luckiest day is: $(printf "%d\n" ${!luckyDays[@]} | sort -n | tail -n1)"

	echo "The largest number is: $(printf "%d\n" ${luckyDays[@]} | sort -n | tail -n1)"

#	for val in ${luckyDays[@]}
#	do
#		 echo "The luckiest day is: $(printf "%d\n" ${!luckyDays[@]} | sort -n | tail -n1)"
		 #echo "val is $val"
#		for val2 in ${collectioPerDay[@]}
#		do
#			if [[ val -eq val2 ]]
#			then
#				echo "day is:${!collectioPerDay[@]}"
#			fi
#		done
#	done
}





totalAmtForAllDays=0
function daysWonLoose()
{
        #echo "All day Collection is:"$allDaysCollection
#        echo "Collection per day for month is:" ${collectionPerDay[@]}

        for i in "${!collectionPerDay[@]}"
        do
		totalAmtForAllDays=$(($totalAmtForAllDays+${collectionPerDay[$i]}))
	done	
	echo "Total collection for $totalDays is $totalAmtForAllDays"

	if [[ $totalAmtForAllDays -gt $stakeForTwentyDays ]]
	then
		winBy=`expr $totalAmtForAllDays - $stakeForTwentyDays`
		echo "Gambler win by:"$winBy
		#choice
	else
		looseBy=`expr $stakeForTwentyDays - $totalAmtForAllDays`
		echo "Gambler loose by:" $looseBy
	fi
	luckyUnluckyDays
}
play
