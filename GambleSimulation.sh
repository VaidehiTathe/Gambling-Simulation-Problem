#!/bin/bash +x

#CONSTANTS FOR THE PROGRAMM
STAKEAMT=100
BETAMT=1
perDayCollection=$((STAKEAMT))


declare -A collectionPerDay
counterForCollectionPerDay=1
totalDays=5
stakeForTwentyDays=$(($STAKEAMT*$totalDays))

#VARIABLES FOR FUNCTIONS daywonloose
countOfDaysWin=0
countOfDaysLoose=0


function play()
{
for(( day=1; day<=$totalDays; day++ ))
do

	
	percent=$(((perDayCollection*50)/100))

	max=$((percent+perDayCollection))
	min=$((perDayCollection-percent))

        while [[ $perDayCollection -le $max &&  $perDayCollection -ge $min ]]
        do
                betCheck=$(($RANDOM%2));
                if [[ $betCheck -eq 1 ]]
                then
                        perDayCollection=$(( $perDayCollection + $BETAMT ))
                else
                        perDayCollection=$(( $perDayCollection - $BETAMT ))
                fi
        done
        collectionPerDay[$day]=$((perDayCollection))
	perDayCollection=$(($perDayCollection)) 
	echo "collection for day $day is:"$perDayCollection
done
daysWonLoose
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
        for(( num=1;num<=size;num++ ))
 	do
		if [[ collectionPerDay[$num] -ge highestAmount ]]
		then
	   		highestAmount=$((collectionPerDay[$num]))
			luck=$num
	        fi
	done
	echo "The luckiest day is: "$luck
	echo "The largest number is: "$highestAmount

        lowestAmount=0;
        for(( num=1;num<=size;num++ ))
        do
                if [[ collectionPerDay[$num] -le lowestAmount ]]
                then
                        lowestAmount=$((collectionPerDay[$num]))
                        unLuck=$num
                fi
        done
        echo "The unluckiest day is: "$unLuck
        echo "The money that get on luckiest day is: "$lowestAmount

}





totalAmtForAllDays=0
function daysWonLoose()
{

	luckyUnluckyDays
        for i in "${!collectionPerDay[@]}"
        do
		totalAmtForAllDays=$(($totalAmtForAllDays+${collectionPerDay[$i]}))
	done	
	echo "Total collection for $totalDays is $totalAmtForAllDays"

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
