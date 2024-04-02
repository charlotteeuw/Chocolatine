##
## EPITECH PROJECT, 2023
## B-PSU-100-MLH-1-1-navy-mael.bertocchi
## File description:
## Makefile
##

NAME	=	my_navy

UNIT	=	unit_tests

SRCS	=	$(shell find ./srcs/ -type f -name '*.c')

TESTS 	=	$(shell find ./tests/ ./srcs/ -type f -name '*.c' ! -name "main.c")

OBJS	=	$(SRCS:.c=.o)

CFLAGS	+= 	-I./include/ -g -Wall -Wextra

LDLIBS	+=	-lcriterion --coverage

$(NAME): $(OBJS)
	$(CC) -o $(NAME) $(OBJS)

$(UNIT):
	$(CC) -o $(UNIT) $(CFLAGS) $(TESTS) $(LDLIBS) $(LOADLIBES)

all: $(NAME)

clean:
	rm -f $(OBJS)

fclean: clean
	rm -f $(NAME)
	rm -f $(UNIT)
	rm -f *.gc*

re: fclean all

tests_run: fclean $(UNIT)
	./$(UNIT)

.PHONY: all clean fclean re tests_run
