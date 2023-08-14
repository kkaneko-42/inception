FROM debian:11
EXPOSE 9000
RUN apt -o Acquire::Check-Valid-Until=false -o Acquire::Check-Date=false update && apt install -y \
        php7.4-fpm \
        php7.4-mysql \
        wget \
    && mkdir /run/php \
    && wget https://ja.wordpress.org/wordpress-6.3-ja.tar.gz \
    && tar -zxf wordpress-6.3-ja.tar.gz \
    && rm -rf wordpress-6.3-ja.tar.gz
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d
COPY ./conf/wp-config.php /wordpress/
COPY ./tools/entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]
