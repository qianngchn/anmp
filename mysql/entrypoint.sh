#!/bin/sh
set -o errexit

ACTION="$1"; shift; FLAGS="$@"

FLAGS="--console --pid-file=/var/lib/mysql/mysql.pid --general-log --general-log-file=/var/lib/mysql/mysql.log --slow-query-log --slow-query-log-file=/var/lib/mysql/mysql-slow.log --log-error=/var/lib/mysql/mysql.err $FLAGS"

chown -R root:root /var/lib/mysql

if [ ! -z $ACTION ]; then
    case $ACTION in
        init)
            if [ ! -d /var/lib/mysql/mysql ]; then
                chown -R root:root /run/mysqld
                chown -R root:root /var/lib/mysql

                echo "Now init mysql database, please wait for a while."
                mysql_install_db --user=root &> /dev/null

                echo "Now start mysql daemon at background."
                mysqld --user=root $FLAGS &> /dev/null &

                echo "Now start mysql secure installation."
                mysql_secure_installation

                echo "Now start mysql client with command < mysql -u root -p >, you can create or import databases."
                exec mysql -u root -p
            fi
            ;;

        start)
            if [ -d /var/lib/mysql/mysql ]; then
                chown -R nobody:nobody /run/mysqld
                chown -R nobody:nobody /var/lib/mysql
                exec mysqld_safe --user=nobody $FLAGS
            fi
            ;;
    esac
fi

exit 0
