COMPOSE_DIR	:= ./srcs

all:
	cd ${COMPOSE_DIR} && docker-compose up -d

clean:
	cd ${COMPOSE_DIR} && docker-compose stop

fclean:
	cd ${COMPOSE_DIR} && docker-compose down

re: fclean
	cd ${COMPOSE_DIR} && docker-compose up -d --build

.PHONY: all, clean, fclean, re
