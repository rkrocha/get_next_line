#!/bin/bash

gcc -Wall -Werror -Wextra -fsanitize=address -g -D BUFFER_SIZE=$1 main_bonus.c get_next_line_bonus.c -I$FT -L$FT -lft -o gnlb || echo "Provide BUFFER_SIZE as first argument!"
