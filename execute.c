
#include "microshell.h"

int execute(char **cmd, char **env)
{
    if (execve(cmd[0], cmd, env) == -1)
    {
        ft_error(1, cmd[0]);
        exit(1);
    }
    return (1);
}

int execute_cmd(t_list *cmds, char **env, int *fildes)
{
    pid_t   pid;

    if ((pid = fork()) == -1)
        return (ft_error(0, NULL));

    if (pid == 0)
    {
        if (cmds->next)
        {
            if ((pipe(fildes)) == -1)
            {
                ft_error(0, NULL);
                exit(1);
            }
            execute_cmd(cmds->next, env, fildes);
            execute(cmds->cmd, env);
        }
        else
            execute(cmds->cmd, env);
    }
    waitpid(pid, NULL, 0);
    return (0);
}