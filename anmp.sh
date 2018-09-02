#!/usr/bin/env bash

LINK="$0"
FILE="$(readlink -f -- $LINK)"
HERE="$(dirname $FILE)"

if [ $# -ne 1 -a $# -ne 2 ]; then
    echo "Usage: $LINK <ACTION> [SERVICE]"
    echo "  ACTION: <init/status/start/stop/restart/shell>"
    echo "  SERVICE: <all/nginx/phpfpm/mysql>"
    exit 1
fi

ACTION="$1"

if [ $# -eq 1 ]; then
    SERVICE="all"
else
    SERVICE="$2"
fi

HOSTIP="172.17.0.1"

MYSQLSCRIPT="$HERE/mysql/docker.sh"
MYSQLINITFLAGS="--add-host host:$HOSTIP -v $HERE/www/data:/var/lib/mysql"
MYSQLSTARTFLAGS="--restart always --add-host host:$HOSTIP -v $HERE/www/data:/var/lib/mysql"

PHPFPMSCRIPT="$HERE/phpfpm/docker.sh"
PHPFPMFLAGS="--restart always --add-host host:$HOSTIP -v $HERE/www/logs:/var/log/php7 -v $HERE/www/html:/var/www/html -v $HERE/www/htdocs:/var/www/localhost/htdocs"

NGINXSCRIPT="$HERE/nginx/docker.sh"
NGINXFLAGS="--restart always --add-host host:$HOSTIP -v $HERE/www/host.d:/etc/nginx/conf.d -v $HERE/www/logs:/var/log/nginx -v $HERE/www/html:/var/www/html -v $HERE/www/htdocs:/var/www/localhost/htdocs"

case $ACTION in
    init)
        if [ $SERVICE = "mysql" -o $SERVICE = "all" ]; then
            $MYSQLSCRIPT init $MYSQLINITFLAGS
        fi
        ;;

    status)
        if [ $SERVICE = "mysql" -o $SERVICE = "all" ]; then
            $MYSQLSCRIPT status
        fi

        if [ $SERVICE = "phpfpm" -o $SERVICE = "all" ]; then
            $PHPFPMSCRIPT status
        fi

        if [ $SERVICE = "nginx" -o $SERVICE = "all" ]; then
            $NGINXSCRIPT status
        fi
        ;;

    start)
        if [ $SERVICE = "mysql" -o $SERVICE = "all" ]; then
            $MYSQLSCRIPT start $MYSQLSTARTFLAGS
        fi

        if [ $SERVICE = "phpfpm" -o $SERVICE = "all" ]; then
            $PHPFPMSCRIPT start $PHPFPMFLAGS
        fi

        if [ $SERVICE = "nginx" -o $SERVICE = "all" ]; then
            $NGINXSCRIPT start $NGINXFLAGS
        fi
        ;;

    stop)
        if [ $SERVICE = "nginx" -o $SERVICE = "all" ]; then
            $NGINXSCRIPT stop
        fi

        if [ $SERVICE = "phpfpm" -o $SERVICE = "all" ]; then
            $PHPFPMSCRIPT stop
        fi

        if [ $SERVICE = "mysql" -o $SERVICE = "all" ]; then
            $MYSQLSCRIPT stop
        fi
        ;;

    restart)
        if [ $SERVICE = "mysql" -o $SERVICE = "all" ]; then
            $MYSQLSCRIPT restart $MYSQLSTARTFLAGS
        fi

        if [ $SERVICE = "phpfpm" -o $SERVICE = "all" ]; then
            $PHPFPMSCRIPT restart $PHPFPMFLAGS
        fi

        if [ $SERVICE = "nginx" -o $SERVICE = "all" ]; then
            $NGINXSCRIPT restart $NGINXFLAGS
        fi
        ;;

    shell)
        if [ $SERVICE = "nginx" ]; then
            $NGINXSCRIPT shell
        fi

        if [ $SERVICE = "phpfpm" ]; then
            $PHPFPMSCRIPT shell
        fi

        if [ $SERVICE = "mysql" ]; then
            $MYSQLSCRIPT shell
        fi
        ;;
esac

exit 0
