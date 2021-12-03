
#include "microshell.h"

int main(int ac, char **ag, char **env)
{
    int     i;
    int     *fildes;
    char    **cmd;
    t_list  *cmds;
    
    if (ac < 2)
        return (1);
    i = 1;
    if (!(fildes = malloc(sizeof(int) * 2)))
        return (ft_error(0, NULL));
    while (i < ac)
    {
        cmds = NULL;
		fildes[0] = 0;
		fildes[1] = 1;
        while (i < ac && strncmp(ag[i], ";\0", 2))
        {
            if (!(cmd = malloc(sizeof(char *))))
                return (ft_error(0, NULL));
            cmd[0] = NULL;
            while (i < ac && strncmp(ag[i], ";\0", 2) && strncmp(ag[i], "|\0", 2))
            {
                if (!(cmd = join(cmd, ag[i])))
                    return (ft_error(0, NULL));
                i++;
            }
            if (!(cmds = addback(newlist(cmd), cmds)))
                return (ft_error(0, NULL));
            if (i < ac && strncmp(ag[i], ";\0", 2))
                i++;
        }
        if ((execute_cmd(cmds, env, fildes, 0)) == -1)
            return (ft_error(0, NULL));
        if (i < ac)
            i++;
        freelist(cmds);
    }
}