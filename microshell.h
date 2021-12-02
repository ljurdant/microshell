
#ifndef MICROSHELL_H
# define MICROSHELL_H

# include <unistd.h>
# include <stdlib.h>
# include <stdio.h>
# include <string.h>
#include <sys/wait.h>

typedef struct  s_list {
    char **cmd;
    struct s_list *next;
}               t_list;

int ft_error(int e, char *s);
t_list  *newlist(char **cmd);
t_list  *addback(t_list *new, t_list *first);
char    **join(char **src, char *str);
void    freelist(t_list *first);
int execute_cmd(t_list *cmds, char **env, int *fildes);

#endif