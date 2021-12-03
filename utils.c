
#include "microshell.h"

int ft_strlen(char *s)
{
    int i;

    i = 0;
    while (s[i])
        i++;
    return (i);
}

void    ft_putstr_fd(char *s, int fd)
{
    write (fd, s, ft_strlen(s));
}

int     ft_error(int e, char *s)
{
    if (e == 0)
        ft_putstr_fd("error: fatal\n", STDERR_FILENO);
    else if (e == 1)
    {
        ft_putstr_fd("error: cannot execute ", STDERR_FILENO);
        ft_putstr_fd(s, STDERR_FILENO);
        ft_putstr_fd("\n", STDERR_FILENO);
    }
    return (1);
}

char    **join(char **src, char *str)
{
    int     size;
    int     i;
    char    **new;

    size = 0;
    while (src[size])
        size++;
    if (!(new = malloc(sizeof(char *) * (size + 2))))
        return (NULL);
    i = 0;
    while (i < size)
    {
        new[i] = src[i];
        i++;
    }
    new[i] = str;
    new[i + 1] = NULL;
    free(src);
    return (new);
}