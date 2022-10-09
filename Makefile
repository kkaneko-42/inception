NAME	:= inception

$(NAME): all

all:
	cd ./srcs && docker-compose up -d

nginx:
	cd ./srcs && docker-compose up -d nginx

wordpress:
	cd ./srcs && docker-compose up -d wordpress

mariadb:
	cd ./srcs && docker-compose up -d mariadb

clean:
	cd ./srcs && docker-compose down

fclean:
	cd ./srcs && docker-compose down --rmi all

re: fclean all

.PHONY: $(NAME) all nginx wordpress mariadb clean fclean re
