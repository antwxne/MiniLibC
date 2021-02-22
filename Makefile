##
## EPITECH PROJECT, 2019
## makefile
## File description:
## makefile
##

ASM_SRC	=	src/my_strlen.asm	\
			src/my_strcmp.asm 	\
			src/my_strncmp.asm	\
			src/my_memcpy.asm 	\
			src/my_memset.asm	\
			src/my_memmove.asm 	\

SRC =

OBJ		= 	$(SRC:.c=.o)

ASM_OBJ	=	$(ASM_SRC:.asm=.o)

NAME	=	libasm.so

CFLAGS	=	-Wall -f elf64

ASFLAGS 	=

CPPFLAGS	=	

CC 	= 	gcc

NASM	=	nasm

all: $(NAME)

$(NAME):	$(ASM_OBJ)
	$(CC) -o $(NAME) $(ASM_OBJ) -shared

%.o:	%.asm
	$(NASM) $(CFLAGS) $(AS_FLAGS) -o $@ $<


clean:
	$(RM) $(OBJ)
	$(RM) $(ASM_OBJ)
	$(RM) *.gc*
	$(RM) unit_tests

fclean:	clean
	$(RM) $(NAME)

re:	fclean
re: all

debug:	CPPFLAGS += -g3 -ggdb
debug:	re

tests_run: LDFLAGS += -lcriterion --coverage
tests_run: AS_FLAGS += -DTU
tests_run: CPPFLAGS += -iquote./tests/
tests_run: CFLAGS := $(filter-out -Werror, $(CFLAGS))
tests_run: SRC += tests/tests.c
tests_run: SRC := $(filter-out main.c, $(SRC))
tests_run: NAME := unit_tests
tests_run: $(ASM_OBJ)
	$(CC) -o $(NAME) $(SRC) $(ASM_OBJ) $(LDFLAGS) $(CPPFLAGS)
	./$(NAME)

.PHONY: all fclean re clean $(NAME) debug tests_run
