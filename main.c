/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rkochhan <rkochhan@student.42sp.org.br>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/02/25 16:45:58 by rkochhan          #+#    #+#             */
/*   Updated: 2021/03/03 12:28:54 by rkochhan         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <fcntl.h>
#include "get_next_line.h"

#define ARG2 av[2] && av[2][0]

int	main(int ac, char **av)
{
	int		fd;
	char	*line;
	int		ret;

	(void)ac;
	fd = open(av[1], O_RDONLY);
	while ((ret = get_next_line(fd, &line)) >= 0)
	{
		if (ARG2 == '1')
			printf("[%d] ", ret);
		printf("%s", line);
		if (ret == 1)
			printf("\n");
		free(line);
		if (ret == 0)
			break ;
	}
	if (ret == -1)
	{
		if (ARG2 == '1')
			printf("[%d] ", ret);
		printf("<ERROR>\n");
		close(fd);
		return (-1);
	}
	close(fd);
	return (0);
}
