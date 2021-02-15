##
## EPITECH PROJECT, 2019
## makefile
## File description:
## makefile
##

SRC	=

OBJ	=	$(SRC:.asm=.o)

NAME	=	libmy_malloc.so

CFLAGS	=	-Wall -Wextra  -fPIC -f elf64

CPPFLAGS	=	-I./include

CC	=	nasm

all: $(NAME)

$(NAME):	$(OBJ)
	$(CC) -shared -fPIC -o $(NAME) $(OBJ)

clean:
	$(RM) $(OBJ)

fclean:	clean
	$(RM) $(NAME)

re:	fclean all $(NAME) debug

debug:	CPPFLAGS += -g3
debug:	re

tests_run: SRC += tests/tests.c
tests_run: LDFLAGS += -lcriterion --coverage
tests_run: CPPFLAGS += -iquote./tests/ -DTU
tests_run: CFLAGS := $(filter-out -Werror, $(CFLAGS))
tests_run: SRC := $(filter-out main.c, $(SRC))
tests_run: NAME := unit_tests
tests_run:
	$(CC) -o $(NAME) $(SRC) $(LDFLAGS) $(CPPFLAGS)
	$(LOAD) ./$(NAME)

.PHONY: all fclean re clean $(NAME) debug
