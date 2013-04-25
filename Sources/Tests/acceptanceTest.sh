#! /usr/bin/env sh

### acceptanceTest.sh ###

function testItCanProvideAllTheScores () {
	cd ..
	./tennisGame.sh ./input.txt > ./results.txt
	diff ./output.txt ./results.txt
	assertTrue 'Expected output differs.' $?
}

## Call and Run all Tests
. "../shunit2-2.1.6/src/shunit2"
