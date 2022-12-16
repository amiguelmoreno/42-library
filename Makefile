# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: antmoren <antmoren@student.42malaga.com    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/04/22 10:11:34 by antmoren          #+#    #+#              #
#    Updated: 2022/12/16 16:47:36 by antmoren         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# GENERAL CONFIG

NAME = 42lib.a

CC		=	gcc
CFLAGS	=	-Wall -Wextra -Werror
RM		=	/bin/rm -f
AR		= 	ar -rcs
RANLIB	= 	ranlib

# MANDATORY FUNCTIONS
LIBFT_FILES	=			ft_isalnum.c		\
						ft_isalpha.c 		\
						ft_isascii.c 		\
						ft_isdigit.c		\
						ft_isprint.c 		\
						ft_strlen.c			\
						ft_strncmp.c 		\
						ft_strlcat.c 		\
						ft_strlcpy.c		\
						ft_strchr.c 		\
						ft_strrchr.c		\
						ft_toupper.c 		\
						ft_tolower.c		\
						ft_atoi.c			\
						ft_bzero.c			\
						ft_memset.c			\
						ft_memcpy.c			\
						ft_memmove.c 		\
						ft_memchr.c 		\
						ft_memcmp.c 		\
						ft_strnstr.c		\
						ft_calloc.c			\
						ft_strdup.c			\
						ft_substr.c 		\
						ft_strjoin.c		\
						ft_strtrim.c		\
						ft_split.c			\
						ft_putchar_fd.c 	\
						ft_putendl_fd.c 	\
						ft_putnbr_fd.c 		\
						ft_putstr_fd.c 		\
						ft_itoa.c 			\
						ft_strmapi.c 		\
						ft_striteri.c 		\
						ft_lstnew.c			\
						ft_lstadd_front.c 	\
						ft_lstsize.c 		\
						ft_lstlast.c 		\
						ft_lstadd_back.c 	\
						ft_lstdelone.c 		\
						ft_lstclear.c 		\
						ft_lstiter.c  		\
						ft_lstmap.c 		\
		
		
FT_PRINTF_FILES		=	ft_print_hex.c		\
						ft_print_ptr.c		\
						ft_print_unsigned.c	\
						ft_printf_utils.c	\
						ft_printf.c			\

GET_NEXT_LINE_FILES = 	get_next_line_bonus.c		\
						get_next_line_utils_bonus.c	\


# Takes the variable value $(SRCS_MAND) or $(SRCS_BONUS), which is a string composed of words separated by spaces, and for each word, replace the suffix .c with .o
LIBFT_OBJ			=	$(LIBFT_FILES:.c=.o)
FT_PRINTF_OBJ		=	$(FT_PRINTF_FILES:.c=.o)
GET_NEXT_LINE_OBJ	=	$(GET_NEXT_LINE_FILES:.c=.o)

# RULES
# 1. "Your Makefile must at least contain the rules $(NAME), all, clean, fclean and re."
# 2. Compile the sources (*.c) to object files (*.o)
# 3. Then generate a library file and index it
# 4. 'nm libft.a' to check content

$(NAME)	:	$(LIBFT_OBJ) $(FT_PRINTF_OBJ) $(GET_NEXT_LINE_OBJ)
			@$(AR) $(NAME) $(LIBFT_OBJ) $(FT_PRINTF_OBJ) $(GET_NEXT_LINE_OBJ)
			@$(RANLIB) $(NAME)
			@echo "\n 📚 Libft | 🖨 ft_printf | 📝 get_next_line compiled! ✅"

all: $(NAME)

# Sample:
# 	gcc -Wall -Wextra -Werror -c ft_isalpha.c -o ft_isalpha.o
#	-c				Only run preprocess, compile, and assemble steps
#	-o <file>		Write output to <file>
#	$< and $@		https://www.gnu.org/software/make/manual/make.html#Automatic-Variables

%.o: %.c 
	@$(CC) $(CFLAGS) -c $< -o $@

# Clean all the output files (*.o)
clean: 
	@$(RM) $(LIBFT_OBJ) $(FT_PRINTF_OBJ) $(GET_NEXT_LINE_OBJ)
	@echo "\n 📚 Libft | 🖨 ft_printf | 📝 get_next_line executable files removed! 🗑"

# Clean all the output files (*.o) and the library file
fclean: clean
	@$(RM) $(NAME)
	@echo "\n 📚 Libft | 🖨 ft_printf | 📝 get_next_line generated files removed! 🗑"

# Clean object files (*.o) and the binary file; 
re: fclean all
	@echo "\n 🔄  ✅ Cleaned and rebuilt everything from 42-library"

.PHONY:	all bonus clean fclean re


