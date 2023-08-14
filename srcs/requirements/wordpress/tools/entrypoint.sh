#!/bin/sh

if [ ! -f /var/www/htdocs/wp-config.php ]; then
    cp -r wordpress/* /var/www/htdocs
fi

/usr/sbin/php-fpm7.4 --nodaemonize
