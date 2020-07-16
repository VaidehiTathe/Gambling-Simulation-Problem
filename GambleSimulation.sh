#!/bin/bash +x

#CONSTANTS FOR THE PROGRAMM
STAKEAMT=100
BETAMT=1
WIN=1
LOOSE=0
ONE=1
perDayCollection=$((STAKEAMT))


declare -A collectionPerDay
counterForCollectionPerDay=1
totalDays=20
stakeForTwentyDays=$(($STAKEAMT*$totalDays))

#VARIABLES FOR FUNCTIONS daywonloose
countOfDaysWin=0
countOfDaysLoose=0
totalAmtForAllDays=0


function play()
{
	for(( day=$ONE; day<=$totalDays; day++ ))
	do
		percent=$(((perDayCollection*50)/100))
		stakeAmt[((count++))]=$(($percent))
		max=$((percent+perDayCollection))
		min=$((perDayCollection-percent))

	        while [[ $perDayCollection -le $max &&  $perDayCollection -ge $min ]]
        	do
                	betCheck=$(($RANDOM%2));
	                if [[ $betCheck -eq $WIN ]]
        	        then
                	        perDayCollection=$(( $perDayCollection + $BETAMT ))
	                else
        	                perDayCollection=$(( $perDayCollection - $BETAMT ))
                	fi
	        done
        	collectionPerDay[$day]=$((perDayCollection))
		echo "collection for day $day is:"$perDayCollection
	done
	luckyUnluckyDays
}


function choice()
{
        read -p "Enter 1 if want to play:" y
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
	size=${#collectionPerDay[@]}
	highestAmount=0;
        for(( day=$ONE;day<=size;day++ ))
 	do
		if [[ collectionPerDay[$day] -ge highestAmount ]]
		then
	   		highestAmount=$((collectionPerDay[$day]))
			luck=$day
	        fi
	done
	echo "The luckiest day is $day and the amount is $highestAmount"

        lowestAmount=${collectionPerDay[1]};
        for(( day=$ONE; day<=size; day++ ))
        do
                if [[ collectionPerDay[$day] -le lowestAmount ]]
                then
                        lowestAmount=$((collectionPerDay[$day]))
                        unLuck=$day
                fi
        done
        echo "The unluckiest day is $unLuck and the amount is $lowestAmount"

daysWonLoose
}

function daysWonLoose()
{

        for day in "${!collectionPerDay[@]}"
        do
		totalAmtForAllDays=$(($totalAmtForAllDays+${collectionPerDay[$day]}))
	done	
	echo "Total collection for $totalDays days is $totalAmtForAllDays"

	if [[ $totalAmtForAllDays -gt $stakeForTwentyDays ]]
	then
		winBy=`expr $totalAmtForAllDays - $stakeForTwentyDays`
		echo "Gambler win by:"$winBy
		choice
	else
		looseBy=`expr $stakeForTwentyDays - $totalAmtForAllDays`
		echo "Gambler loose by:" $looseBy
	fi


}
play
