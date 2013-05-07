#! /usr/bin/env sh

### tennisGame.sh ###

. ./functions.sh

dump=`cat $1`

playersLine=`echo "$dump" | sed -n '1p'`
firstPlayerName=`getFirstPlayerFrom "$playersLine"`
secondPlayerName=`getSecondPlayerFrom "$playersLine"`

gameLog=`echo "$dump" | sed -n '1!p'`

echo "$playersLine"
echo "$gameLog" | while read line; do
  let firstPlayerScore=firstPlayerScore+`getScoreFor "$firstPlayerName" "$line"`
  let secondPlayerScore=secondPlayerScore+`getScoreFor "$secondPlayerName" "$line"`
  displayScore "$firstPlayerName" $firstPlayerScore \
               "$secondPlayerName" $secondPlayerScore
done
