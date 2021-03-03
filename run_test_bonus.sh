#!/bin/bash

TEST_DIV="================================="

echo START
rm gnlb &>/dev/null
sh comp_gnl_bonus.sh 32

for i in 1 2
do
	echo -e "$TEST_DIV"
	printf '\n'
	echo "$(wc -l ./tests/file$i) lines"
	./gnlb | grep file$i > output
	echo "$(wc -l output) lines"
	cut -d " " -f 2- output > output$i
	diff -sq ./tests/file$i output$i
	rm output output$i &>/dev/null
	printf '\n'
done
echo $TEST_DIV

#static variables
echo -e "\nSTATIC VARIABLES\n\nMANDATORY PART:"
grep -v \( get_next_line.* | grep "static" | awk '{$1=$1};1'

echo -e "\nBONUS PART:"
grep -v \( get_next_line_* | grep "static" | awk '{$1=$1};1'

rm gnlb &>/dev/null

echo -e "\n$TEST_DIV\nFINISH"
