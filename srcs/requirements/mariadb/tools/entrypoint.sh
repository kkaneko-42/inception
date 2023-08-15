#!/bin/sh

# if first launch
if [ ! -d /var/lib/mysql/mysql ]; then
    chown -R mysql:mysql /var/lib/mysql
    mariadb-install-db --skip-test-db

    # Start config server, and get its PID
    /usr/sbin/mariadbd & MARIADB_PID=$!

    # Poll config server starting
    for i in {10...0}; do
        if mariadb -e "SELECT 0;"; then
            break
        fi
        sleep 1
    done

    if [ $i -eq 0 ]; then
        echo "failed to start mariadb server"
        exit 1
    fi

    # Create db for wordpress
    mariadb -e "CREATE DATABASE IF NOT EXISTS wordpress;"
    # Create new user
    mariadb -e "CREATE USER '$MYSQL_USER'@'wordpress.backend' IDENTIFIED BY '$MYSQL_PASSWORD';"
    mariadb -e "GRANT ALL ON wordpress.* TO '$MYSQL_USER'@'wordpress.backend';"
    # Change root password
    mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"

    # Stop config server
    kill ${MARIADB_PID}
    wait ${MARIADB_PID}

fi # end of configuration

# Start db server
/usr/sbin/mariadbd
