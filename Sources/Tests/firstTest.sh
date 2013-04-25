#! /usr/bin/env sh

### firstTest.sh ###

function testWeCanWriteTests () {
	assertEquals "it works" "it does not work"
}

## Call and Run all Tests
. "../shunit2-2.1.6/src/shunit2"
