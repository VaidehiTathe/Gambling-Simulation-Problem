

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

        while [[ $totalAmt -le $max && $totalAmt -ge $min ]]
        do
                betCheck=$(($RANDOM%2));
                if [[ $betCheck -eq 1 ]]
                then
                        totalAmt=$(( $totalAmt + $betAMT ))
                else
                        totalAmt=$(( $totalAmt - $betAMT ))
                fi
        done
        collectionPerDay[$day]=$((totalAmt))
        allDaysCollection=$(($allDaysCollection+$totalAmt))
        totalAmt=$(($stakeAMT))
