FROM debian:11
EXPOSE 9000
RUN apt -o Acquire::Check-Valid-Until=false -o Acquire::Check-Date=false update \
    && apt install -y php7.4-fpm \
    && mkdir /run/php
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d
ENTRYPOINT ["/usr/sbin/php-fpm7.4", "--nodaemonize"]
