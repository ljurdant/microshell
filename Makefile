
NAME =	microshell

FLAGS =	-Wall -Wextra -Werror -g

SRCS =	main.c\
		execute.c\
		utils.c\
		listfunctions.c

OBJS =	${SRCS:.c=.o}

all: $(NAME)

%.o: %.c
	gcc $(FLAGS) -c $< -o $@

$(NAME) : $(OBJS)
	gcc $(OBJS) $(LIBS) -o $(NAME)

clean :
	rm -f $(OBJS)

fclean: clean
	rm -rf $(NAME)


re: fclean all

.PHONY  : all fclean re