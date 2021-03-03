#!/bin/bash

TEST_DIV="================================="

#norminette
echo -e "START\n$TEST_DIV\n\nNORMINETTE:"
norminette get*.[ch]
echo -e "\n$TEST_DIV \n"

#check prototypes and declaration
echo -e "PROTOTYPES AND DECLARATION\n\nMANDATORY PART:"
echo "int get_next_line(int fd, char **line); -> from gnl subject"
echo "$(grep "^int\s*get_next_line" get_next_line.h | awk '{$1=$1};1') -> from get_next_line.h"
echo "$(grep "^int\s*get_next_line" get_next_line.c | awk '{$1=$1};1') -> from get_next_line.c"

echo -e "\nBONUS PART:"
echo "int get_next_line(int fd, char **line); -> from gnl subject"
echo "$(grep "^int\s*get_next_line" get_next_line_bonus.h | awk '{$1=$1};1') -> from get_next_line_bonus.h"
echo "$(grep "^int\s*get_next_line" get_next_line_bonus.c | awk '{$1=$1};1') -> from get_next_line_bonus.c"

echo -e "\n$TEST_DIV \n"
read -p "Press enter to continue"
echo ""

#start testing
for j in -20 -1 0 1 2 6 32 128 512 4096 999999999
do
	echo -e "$TEST_DIV \n"
	rm gnl &>/dev/null
	sh comp_gnl.sh $j
	echo -e "For BUFFER_SIZE = $j\n"
	for i in 0 1 2 3 4 5 6
	do
		./gnl ./tests/file$i > output$i && diff -sq ./tests/file$i output$i
		echo -e "Program finished with return: $? \n"
		rm output$i &>/dev/null
	done
	read -p "Press enter to continue"
done
echo -e "\n$TEST_DIV\n"

#read from STDIN
rm gnl &>/dev/null
sh comp_gnl.sh 32
echo -e "TEST READING FROM STDIN\nType several short lines, long lines, weird lines and compare results: "
./gnl /dev/stdin
echo -e "\n$TEST_DIV\n"

#print with return values
for k in 0 1 2 3 4 5 6
do
	echo ""
	read -p "Press enter to print file$k with return values"
	echo -e "\n$TEST_DIV"
	rm gnl &>/dev/null
	sh comp_gnl.sh 32 && ./gnl ./tests/file$k 1
	echo -e "\n$TEST_DIV"
done

rm gnl &>/dev/null

echo FINISH
