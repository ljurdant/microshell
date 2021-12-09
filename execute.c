
#include "microshell.h"

int execute(char **cmd, char **env)
{
    if (execve(cmd[0], cmd, env) == -1)
    {
        ft_error(1, cmd[0]);
    }
    return (1);
}

int	pipe_execute(int *fildes, t_list *cmds, char **env)
{
	pid_t	pid_fork;

	if ((pipe(fildes)) == -1)
	{
		ft_error(0, NULL);
		exit(1);
	}
	if ((pid_fork = fork()) == -1)
		return (ft_error(0, NULL));
	if (pid_fork == 0)
	{
		dup2(fildes[1], 1);
		close(fildes[0]);
		close(fildes[1]);
		execute(cmds->cmd, env);
	}
	else
	{
		dup2(fildes[0], 0);
		close(fildes[1]);
		close(fildes[0]);
		if (!cmds->next->next)
			execute(cmds->next->cmd, env);
		else
			pipe_execute(fildes, cmds->next, env);
	}
	return(0);
}


int execute_cmd(t_list *cmds, char **env, int *fildes, int p)
{
    pid_t   pid;
	

	if ((pid = fork()) == -1)
		return (ft_error(0, NULL));
	(void)p;
    if (pid == 0)
    {
		if (cmds->next)
			pipe_execute(fildes, cmds, env);
		else
			execute(cmds->cmd, env);
    }
	waitpid(pid, NULL, 0);
	
    return (0);
}