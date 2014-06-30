#!/bin/bash

export PHP_BINARIES="$1"
DIR="$(pwd)"
export TEST_DIR="$DIR/$0/"

TEST_NUMBER=("$TEST_DIR"*)
TEST_NUMBER=${#TEST_NUMBER[@]}

set +e

INCREMENT=1
for f in "$TEST_DIR"*; do
	echo -n "[$INCREMENT/$TEST_NUMBER] $f ... "
	chmod +x "$f"
	"$f"
	STATUS=$?
	if [ $STATUS != 0 ]; then
		echo "FAILED!"
		exit 1
	else
		echo "OK"
	fi
	INCREMENT=$((INCREMENT+1))
done

exit 0