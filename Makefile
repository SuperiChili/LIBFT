# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rpaic <marvin@42.fr>                       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/10/25 16:46:45 by rpaic             #+#    #+#              #
#    Updated: 2023/10/25 16:46:48 by rpaic            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libft.a

CC = gcc
CFLAGS = -Wall -Wextra -Werror

SRC = ft_memchr.c ft_isprint.c  ft_calloc.c ft_memset.c ft_memmove.c ft_memcpy.c \
	ft_strncmp.c ft_memcmp.c ft_strlen.c ft_strlcpy.c ft_strnstr.c ft_strdup.c ft_strrchr.c \
	ft_strjoin.c ft_strtrim.c ft_strchr.c ft_substr.c ft_strlcat.c ft_strmapi.c \
	ft_striteri.c ft_putstr_fd.c ft_tolower.c ft_toupper.c ft_isalpha.c ft_isdigit.c \
	ft_isalnum.c ft_bzero.c \
	ft_isascii.c ft_atoi.c ft_split.c ft_itoa.c ft_putendl_fd.c ft_putchar_fd.c ft_putnbr_fd.c

BONUS_SRC = ft_lstnew_bonus.c ft_lstadd_front_bonus.c ft_lstsize_bonus.c ft_lstlast_bonus.c \
	ft_lstadd_back_bonus.c ft_lstdelone_bonus.c ft_lstclear_bonus.c \
	ft_lstiter_bonus.c  ft_lstmap_bonus.c
OBJ = $(SRC:.c=.o)

BONUS_OBJ = $(BONUS_SRC:.c=.o)

all: $(NAME)

$(NAME): $(OBJ)
	@ar rc $(NAME) $(OBJ)
	@ranlib $(NAME)
	@echo "LIBFT compliled with succes"

bonus:	$(OBJ) $(BONUS_OBJ)
	@ar rc $(NAME) $(OBJ) $(BONUS_OBJ)
	@ranlib $(NAME)
	@echo "LIBFT compliled with BONUS succes"

%.o: %.c libft.h
	@$(CC) $(CFLAGS) -c $< -o $@

test: libft.a
	@$(CC) $(CFLAGS) $(p) -L. -lft -lbsd
clean:
	@rm -f $(OBJ) $(BONUS_OBJ)
	@echo "Obj file removed."
	
fclean: clean
	@rm -f $(NAME)
	@echo "Libreria rimossa."

re: fclean all

.PHONY: all clean fclean re bonus
