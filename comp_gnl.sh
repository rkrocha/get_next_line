#!/bin/bash

gcc -Wall -Werror -Wextra -fsanitize=address -g -D BUFFER_SIZE=$1 main.c get_next_line.c -I$FT -L$FT -lft -o gnl || echo "Provide BUFFER_SIZE as first argument!"
