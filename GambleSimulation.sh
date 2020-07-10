#!/bin/bash -x
STAKE_AMT=100
BET_AMT=1
WIN=1
LOOSE=0

random=$((RANDOM%2))
echo "Value generated is:"$random

if [[ $random -eq $WIN ]]
then
	echo "You Win $"$BET_AMT
else
	echo "You loose $"$BET_AMT
fi
