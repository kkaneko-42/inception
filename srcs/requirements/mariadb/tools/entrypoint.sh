#!/bin/sh

# if first launch
chown -R mysql:mysql /var/lib/mysql
mariadb-install-db --skip-test-db
# endif

# Start config server, and get its PID
/usr/sbin/mariadbd & MARIADB_PID=$!

# Polling config server starting
for i in {0..5}; do
    #if # daemon started
    #    break
    #fi
    sleep 1
done

#if # i is end of limit
#    echo "failed to start mariadb server"
#    exit 1
#fi

# if first launch
# Create db for wordpress
mariadb -e "CREATE DATABASE IF NOT EXISTS wordpress;"
# Create new root
mariadb -e "CREATE USER 'root'@'wordpress.backend' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"
mariadb -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'wordpress.backend';"
# Create new user
mariadb -e "CREATE USER '$MYSQL_USER'@'wordpress.backend' IDENTIFIED BY '$MYSQL_PASSWORD';"
mariadb -e "GRANT ALL ON wordpress.* TO '$MYSQL_USER'@'wordpress.backend';"
# Change root password
mariadb -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"
# endif

# Stop config server
kill ${MARIADB_PID}
wait ${MARIADB_PID}

# Start db server
/usr/sbin/mariadbd
