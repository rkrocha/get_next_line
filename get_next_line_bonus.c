/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   get_next_line_bonus.c                              :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rkochhan <rkochhan@student.42sp.org.br>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/02/25 19:22:07 by rkochhan          #+#    #+#             */
/*   Updated: 2021/03/06 09:27:16 by rkochhan         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "get_next_line_bonus.h"

static void		ft_strdel(char **str)
{
	if (str && *str)
	{
		free(*str);
		*str = NULL;
	}
}

static int		get_lines(char **str, char **line, bool *found_eof)
{
	size_t		len;
	char		*temp;

	len = 0;
	while ((*str)[len] != '\n' && (*str)[len] != '\0')
		len++;
	if ((*str)[len] == '\n')
	{
		*line = ft_substr(*str, 0, len);
		temp = ft_strdup(&((*str)[len + 1]));
		free(*str);
		*str = temp;
		temp = NULL;
		if (*found_eof && (*str)[0] == '\0')
			ft_strdel(str);
		return (1);
	}
	else
	{
		*line = ft_strdup(*str);
		ft_strdel(str);
		*found_eof = false;
		return (0);
	}
}

static ssize_t	read_file(int fd, char **leftover)
{
	ssize_t		nread;
	char		*buffer;
	char		*temp;

	if (!(buffer = malloc((BUFFER_SIZE + 1) * sizeof(char))))
		return (-1);
	while ((nread = read(fd, buffer, BUFFER_SIZE)) > 0)
	{
		buffer[nread] = '\0';
		if (!(*leftover))
			*leftover = ft_strdup("");
		temp = ft_strjoin(*leftover, buffer);
		free(*leftover);
		*leftover = temp;
		temp = NULL;
		if (ft_strchr(*leftover, '\n'))
			break ;
	}
	ft_strdel(&buffer);
	return (nread);
}

int				get_next_line(int fd, char **line)
{
	static char	*leftover[MAX_INPUT_FILES];
	static bool	found_eof[MAX_INPUT_FILES];
	ssize_t		nread;

	if (fd < 0 || fd >= MAX_INPUT_FILES || BUFFER_SIZE < 1 || !line)
		return (-1);
	if (!found_eof[fd] && !ft_strchr(leftover[fd], '\n'))
	{
		nread = read_file(fd, &leftover[fd]);
		if (nread < 0)
		{
			ft_strdel(&leftover[fd]);
			return (-1);
		}
		else if (nread == 0)
			found_eof[fd] = true;
	}
	if (found_eof[fd] && !leftover[fd])
	{
		*line = ft_strdup("");
		found_eof[fd] = false;
		return (0);
	}
	return (get_lines(&leftover[fd], line, &found_eof[fd]));
}
