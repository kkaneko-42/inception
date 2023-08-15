COMPOSE_DIR	:= ./srcs
include ${COMPOSE_DIR}/.env

all:
	${COMPOSE_DIR}/requirements/tools/setup.sh ${COMPOSE_DIR}
	cd ${COMPOSE_DIR} && docker-compose up -d --build

clean:
	cd ${COMPOSE_DIR} && docker-compose stop

fclean:
	cd ${COMPOSE_DIR} && docker-compose down

.PHONY: all clean fclean
