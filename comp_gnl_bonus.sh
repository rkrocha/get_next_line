#!/bin/bash

if [ -z "$1" ]
then
	DEF_BUFFER_SIZE=""
else
	DEF_BUFFER_SIZE="-D BUFFER_SIZE=$1"
fi

gcc -Wall -Werror -Wextra -fsanitize=address -g $DEF_BUFFER_SIZE main_bonus.c get_next_line_bonus.c -I$FT -L$FT -lft -o gnlb
