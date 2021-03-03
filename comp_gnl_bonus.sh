#!/bin/bash

gcc -Wall -Werror -Wextra -fsanitize=address -g -D BUFFER_SIZE=$1 main_bonus.c get_next_line_bonus.c get_next_line_utils_bonus.c -o gnlb || echo "Provide BUFFER_SIZE as first argument!"
