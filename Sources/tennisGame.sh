#! /usr/bin/env sh

### tennisGame.sh ###

. ./functions.sh

playersLine=`head -n 1 $1`
echo "$playersLine"
firstPlayer=`getFirstPlayerFrom "$playersLine"`
secondPlayer=`getSecondPlayerFrom "$playersLine"`

wholeScoreFileContent=`cat $1`
totalNoOfLines=`echo "$wholeScoreFileContent" | wc -l`
for currentLine in `seq 2 $totalNoOfLines`
	do
	firstPlayerScore=$(getScoreFor $firstPlayer "`echo \"$wholeScoreFileContent\" | head -n $currentLine`")
	secondPlayerScore=$(getScoreFor $secondPlayer "`echo \"$wholeScoreFileContent\" | head -n $currentLine`")
	displayScore $firstPlayer $firstPlayerScore $secondPlayer $secondPlayerScore
done
