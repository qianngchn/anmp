#!/bin/sh

LINK="$0"
FILE="$(readlink -f -- $LINK)"
HERE="$(dirname $FILE)"

if [ $# -ne 1 ]; then
    echo "Usage: $LINK <ACTION>"
    echo "  ACTION: <init/start>"
    exit 1
fi

ACTION="$1"

FLAGS="--console --skip-networking=0 --port=3306 --socket=/run/mysqld/mysqld.sock --pid-file=/var/lib/mysql/mysql.pid --general-log --general-log-file=/var/lib/mysql/mysql.log --slow-query-log --slow-query-log-file=/var/lib/mysql/mysql-slow.log --log-error=/var/lib/mysql/mysql.err"

case $ACTION in
    init)
        if [ ! -d /var/lib/mysql/mysql ]; then
            chown -R root:root /run/mysqld
            chown -R root:root /var/lib/mysql

            echo "Step 1: init mysql database, please wait for a while."
            mysql_install_db --user=root &> /dev/null

            echo "Step 2: start mysql daemon at background."
            nohup mysqld --user=root --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci $FLAGS &> /dev/null &

            echo "Step 3: start mysql secure installation."
            mysql_secure_installation

            echo "Step 4: start mysql client with command < mysql -u root -p >, you can create users and import databases."
            echo "Create user: GRANT ALL PRIVILEGES ON *.* TO 'root'@'host' IDENTIFIED BY 'root';"
            echo "Create database: CREATE DATABASE IF NOT EXISTS database;"
            echo "Import database: USE database; SOURCE /var/lib/mysql/database.sql;"
            exec mysql -u root -p
        fi
        ;;

    start)
        if [ -d /var/lib/mysql/mysql ]; then
            chown -R nobody:nobody /run/mysqld
            chown -R nobody:nobody /var/lib/mysql

            exec mysqld_safe --user=nobody --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci $FLAGS
        fi
        ;;
esac

exit 0
