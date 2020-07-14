#!/bin/bash +x

#CONSTANTS FOR THE PROGRAMM
stakeAMT=100
betAMT=1
totalAmt=$((stakeAMT))
prevDayCollection=$((stakeAMT))


#percent=$(((stakeAMT*50)/100))
#echo "percentage:"$percent

#max=$((percent+stakeAMT))
#min=$((stakeAMT-percent))


declare -A collectionPerDay
totalDays=5
stakeForTwentyDays=$(($stakeAMT*$totalDays))

#VARIABLES FOR FUNCTIONS daywonloose
countOfDaysWin=0
countOfDaysLoose=0
declare -a luckyDays
counterOfLuckyDays=0
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
#if [[ $prevDayCollection -gt $stakeForTwentyDays ]]
#then
 #       winBy=`expr $prevDayCollection - $stakeForTwentyDays`
  #      echo "Gambler win by:"$winBy
   #     choice
#else
 #       looseBy=`expr $stakeForTwentyDays - $prevDayCollection`
  #      echo "Gambler loose by:" $looseBy
#fi
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
		choice
	else
		looseBy=`expr $stakeForTwentyDays - $totalAmtForAllDays`
		echo "Gambler loose by:" $looseBy
	fi

		
#                if [[ ${collectionPerDay[$i]} -gt $max ]]
 #               then
  #                      ((countOfDaysWin++))
   #                     luckyDays[((counterOfLuckyDays++))]=$i
      #          elif [[ ${collectionPerDay[$i]} -lt $min ]]
     #           then
    #                    ((countOfDaysLoose++))
       #                 unluckyDays[((counterOfUnluckyDays++))]=$i
	#	else
	#		exit
	#	fi
	#done
	#echo "Total collection for $totalDays is $totalAmtForAllDays"
	echo "Count of days gambler won the game is:" $countOfDaysWin
	echo "Luckiest days of gambler is:" ${luckyDays[@]}
	echo "Count of days gambler loose the game is:" $countOfDaysLoose
	echo "Unluckiest days of gambler is:" ${unluckyDays[@]}
}

play
