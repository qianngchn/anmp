#!/bin/sh
set -o errexit

ACTION="$1"

if [ ! -z $ACTION ]; then
    case $ACTION in
        init)
            if [ ! -d /var/lib/mysql/mysql ]; then
                echo "Now init mysql database, please wait for a while."
                mysql_install_db --user=nobody &> /dev/null
                chown -R nobody:nobody /var/log/mysql
                chown -R nobody:nobody /var/lib/mysql

                echo "Now start mysql daemon at background."
                mysqld --user=nobody --pid-file=/var/lib/mysql/mysql.pid &> /dev/null &

                echo "Now start mysql secure installation."
                mysql_secure_installation

                echo "Now start mysql client with command < mysql -u root -p >, you can create or import databases."
                exec mysql -u root -p
            fi
            ;;

        start)
            if [ -d /var/lib/mysql/mysql ]; then
                exec mysqld_safe --console --user=nobody --pid-file=/var/lib/mysql/mysql.pid --general-log --general-log-file=/var/log/mysql/mysql.log --slow-query-log --slow-query-log-file=/var/log/mysql/mysql.slow_log --log-error=/var/log/mysql/mysql.error_log
            fi
            ;;
    esac
fi

exit 0
