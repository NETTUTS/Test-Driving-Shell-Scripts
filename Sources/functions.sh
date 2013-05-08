function getFirstPlayerFrom () {
  echo $1 | sed 's/ - .*//'
}

function getSecondPlayerFrom () {
  echo $1 | sed 's/^.* - //'
}

function getScoreFor () {
  player=$1
  standings=$2
  echo `echo "$standings" | grep "$player" | wc -l`
}

function displayScore () {
  firstPlayerName=$1; firstPlayerScore=$2
  secondPlayerName=$3; secondPlayerScore=$4

  if outOfRegularScore $firstPlayerScore $secondPlayerScore ; then
    checkEquality $firstPlayerScore $secondPlayerScore
    checkAdvantageFor $firstPlayerName $firstPlayerScore $secondPlayerScore
    checkAdvantageFor $secondPlayerName $secondPlayerScore $firstPlayerScore
  else
    echo "$firstPlayerName: $(convertToTennisScore $firstPlayerScore)" \
         "- $secondPlayerName: $(convertToTennisScore $secondPlayerScore)"
  fi
}

function outOfRegularScore () {
  [ $1 -gt 2 ] && [ $2 -gt 2 ]
  return $?
}

function checkEquality () {
  if [ $1 -eq $2 ]; then
    echo 'Deuce'
  fi
}

function checkAdvantageFor () {
  if [ $2 -gt $3 ]; then
    if [ `expr $2 - $3` -gt 1 ]; then
      echo "$1: Winner"
    else
      echo "$1: Advantage"
    fi
  fi
}

function convertToTennisScore () {
  declare -a scoreMap=(0 15 30 40)
  echo ${scoreMap[$1]}
}
