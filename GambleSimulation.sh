#!/bin/bash -x

#CONSTANTS FOR THE PROGRAMM
STAKE_AMT=100
BET_AMT=1
WIN=1
LOOSE=0

#VARIABLES
totalbet_win_amt=0
totalbet_loose_amt=0

percent=$(((STAKE_AMT*50)/100))
echo "percentage:"$percent

max=$((percent+STAKE_AMT))
min=$((STAKE_AMT-percent))

chance=0;
while [[ $total_amt -lt $max && $chance -lt $min ]]
do
((chance++))
betCheck=$(($RANDOM%2));
case $betCheck in
  $WIN)
      BET_AMT=1
         ;;
  $LOOSE)
       BET_AMT=1
        ;;
esac
total_amt=$(( $total_amt + $BET_AMT ));

done

echo "total amount is:" $total_amt
#totalSalary=$(($totalEmpHrs*$EMP_RATE_PER_HR))





#while [[ $totalbet_win_amt -lt $max && $totalbet_loose_amt -gt $min ]]
#do
#	random=$((RANDOM%2))
#	if [[ $random -eq $WIN ]]
#	then
#		echo "You Win $"$BET_AMT
#		totalbet_win_amt=$(( $totalbet_win_amt + $BTE_AMT ))
#	else
#		echo "You loose $"$BET_AMT
#		totalbet_loose_amt=$(( $totalbet_loose_amt + $BET_AMT))
#	fi
#totalbet_win_amt=$(( $totalbet_win_amt + $BTE_AMT ))
#totalbet_loose_amt=$(( $totalbet_loose_amt + $BET_AMT))
#done
#echo "Total winning amount is:" $totalbet_win_amt
#echo "Total loosing amount is:" $totalbet_loose_amt

