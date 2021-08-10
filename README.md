<br/>
<p align="center">
  <a href="https://github.com/rkrocha/42cursus/blob/master/subjects/01.get_next_line.pdf">
    <img src="https://github.com/rkrocha/42cursus/blob/master/badges/get_next_linee.png" alt="Logo" width="150" height="150">
  </a>

  <p align="center">
    Reading a line on a fd is way too tedious.
    <br/>
    <br/>
  </p>
</p>



## About The Project

The aim of this project is to make you code a function that returns a line ending with a newline, read from a file descriptor.

For more information check out this project's [PDF](https://github.com/rkrocha/42cursus/blob/master/subjects/01.get_next_line.pdf).

## Built With

C, with some Shell for testing purposes.

## Prerequisites

* A Shell terminal
* gcc compiler

### Installation

Clone the repo

```sh
git clone git@github.com:rkrocha/get_next_line.git
```

## Usage

1. Copy get_next_line.c and get_next_line.h (or their bonus counterparts) to your program's folder, and include the header in your program:

```c
#include "get_next_line.h"
```

2. A simple program would look like this:

```c
#include <stdio.h>
#include <fcntl.h>
#include "get_next_line.h"

int	main(void)
{
	int	fd;
	int	ret;
	char	*line;

	fd = open("./path/to/text_file.txt", O_RDONLY);
	while ((ret = get_next_line(fd, &line)) >= 0)
	{
		printf("%s\n", line);
		free(line);
		if (ret == 0)
			break ;
	}
	if (ret == -1)
	{
		printf("<ERROR>\n");
		close(fd);
		return (-1);
	}
	close(fd);
	return (0);
}

```

OR

Test it in its own folder by running the script:

```sh
sh run_test.sh
```
