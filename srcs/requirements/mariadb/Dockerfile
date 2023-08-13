FROM debian:11
EXPOSE 3306
# COPY ./tools/init.sql /
COPY ./tools/entrypoint.sh /
RUN apt -o Acquire::Check-Valid-Until=false -o Acquire::Check-Date=false update && apt install -y mariadb-server \
    && mkdir /run/mysqld && chown -R mysql /run/mysqld
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d
ENTRYPOINT ["/entrypoint.sh"]
