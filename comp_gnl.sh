#!/bin/bash

gcc -Wall -Werror -Wextra -fsanitize=address -g -D BUFFER_SIZE=$1 main.c get_next_line.c get_next_line_utils.c -o gnl || echo "Provide BUFFER_SIZE as first argument!"
