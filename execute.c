
#include "microshell.h"

int execute(char **cmd, char **env)
{
    if (execve(cmd[0], cmd, env) == -1)
    {
        ft_error(1, cmd[0]);
    }
    return (1);
}



int execute_cmd(t_list *cmds, char **env, int *fildes, int p)
{
    pid_t   pid;
	pid_t	pid_fork;

	if (!p)
	{
    	if ((pid = fork()) == -1)
        	return (ft_error(0, NULL));
	}

    if (pid == 0 || p)
    {
        if (cmds->next)
        {
            if ((pipe(fildes)) == -1)
            {
                ft_error(0, NULL);
                exit(1);
            }
			if ((pid_fork = fork()) == -1)
        		return (ft_error(0, NULL));
			if (pid_fork == 0)
			{
				dup2(fildes[0], 0);
				close(fildes[1]);
				waitpid(0, NULL, 0);
				execute_cmd(cmds->next, env, fildes, 1);
			}
			else
			{
				dup2(fildes[1], 1);
				close(fildes[0]);
				execute(cmds->cmd, env);
			}	
        }
        else
			execute(cmds->cmd, env);
    }
	if (!p)
		waitpid(pid, NULL, 0);
    return (0);
}