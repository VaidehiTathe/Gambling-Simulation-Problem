

#CONSTANTS FOR THE PROGRAMM
stakeAMT=100
betAMT=1
win=1
loose=0

#VARIABLES
totalbetWinAmt=0
totalbetLooseAmt=0

percent=$(((stakeAMT*50)/100))
echo "percentage:"$percent

max=$((percent+stakeAMT))
min=$((stakeAMT-percent))


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

