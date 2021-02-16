##
## EPITECH PROJECT, 2019
## makefile
## File description:
## makefile
##

ASM_SRC	=	src/my_strlen.asm

SRC =

OBJ		= 	$(SRC:.c=.o)

ASM_OBJ	=	$(ASM_SRC:.asm=.o)

NAME	=	libmy_test.so

CFLAGS	=	-Wall -f elf64

CPPFLAGS	=	

CC 	= 	gcc

NASM	=	nasm

all: $(NAME)

$(NAME):	$(OBJ)
	gcc -o $(NAME) $(OBJ)

%.o:	%.asm
	$(NASM) $(CFLAGS) -o $@ $<


clean:
	$(RM) $(OBJ)
	$(RM) $(ASM_OBJ)
	$(RM) *.gc*
	$(RM) unit_tests

fclean:	clean
	$(RM) $(NAME)

re:	fclean all $(NAME) debug

debug:	CFLAGS += -g3
debug:	re


tests_run: LDFLAGS += -lcriterion --coverage
tests_run: CPPFLAGS += -iquote./tests/ -DTU
tests_run: CFLAGS := $(filter-out -Werror, $(CFLAGS))
tests_run: CFLAGS += -DTU
tests_run: SRC += tests/tests.c
tests_run: SRC := $(filter-out main.c, $(SRC))
tests_run: NAME := unit_tests
tests_run: $(ASM_OBJ)
	$(CC) -o $(NAME) $(SRC) $(ASM_OBJ) $(LDFLAGS) $(CPPFLAGS)
	./$(NAME)

.PHONY: all fclean re clean $(NAME) debug tests_run
