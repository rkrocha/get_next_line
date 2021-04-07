#!/bin/bash

if [ -z "$1" ]
then
	DEF_BUFFER_SIZE=""
else
	DEF_BUFFER_SIZE="-D BUFFER_SIZE=$1"
fi

gcc -Wall -Werror -Wextra -fsanitize=address -g $DEF_BUFFER_SIZE main.c get_next_line.c -I$FT -L$FT -lft -o gnl
