
#include "microshell.h"

t_list  *newlist(char **cmd)
{
    t_list  *new;
    if(!(new = malloc(sizeof(t_list))))
        return (NULL);
    new->cmd = cmd;
    new->next = NULL;
    return (new);
}

t_list  *addback(t_list *new, t_list *first)
{
    t_list  *iter;
    
    if (!first)
        return (new);
    iter = first;
    while (iter->next)
        iter = iter->next;
    iter->next = new;
    return (first);
}

void    freelist(t_list *first)
{
    t_list  *iter;
    t_list  *tmp;

    iter = first;
    while (iter)
    {
        tmp = iter->next;
        free(iter->cmd);
        free(iter);
        iter = tmp;
    }
} 