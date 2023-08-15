COMPOSE_DIR	:= ./srcs
include ${COMPOSE_DIR}/.env

all:
	if ! grep ${DOMAIN_NAME} /etc/hosts; then echo "127.0.0.1    ${DOMAIN_NAME}" >> /etc/hosts; fi
	cd ${COMPOSE_DIR} && docker-compose build && docker-compose up -d

clean:
	cd ${COMPOSE_DIR} && docker-compose stop

fclean:
	cd ${COMPOSE_DIR} && docker-compose down

re: fclean
	cd ${COMPOSE_DIR} && docker-compose up -d --build

.PHONY: all, clean, fclean, re
