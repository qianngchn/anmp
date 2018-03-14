#!/usr/bin/env bash
set -o errexit

LINK=$(readlink -f "$0")
HERE=$(dirname "$LINK")
HOSTIP="172.17.42.1"

ACTION="$1"
SERVICE="$2"

MYSQLSCRIPT="$HERE/mysql/docker.sh"
MYSQLINITFLAGS="--add-host host:$HOSTIP -v $HERE/www/data:/var/lib/mysql"
MYSQLSTARTFLAGS="--restart always --add-host host:$HOSTIP -v $HERE/www/data:/var/lib/mysql"

PHPFPMSCRIPT="$HERE/phpfpm/docker.sh"
PHPFPMFLAGS="--restart always --add-host host:$HOSTIP -v $HERE/www/logs:/var/log/php7 -v $HERE/www/html:/var/www/html -v $HERE/www/htdocs:/var/www/localhost/htdocs"

NGINXSCRIPT="$HERE/nginx/docker.sh"
NGINXFLAGS="--restart always --add-host host:$HOSTIP -v $HERE/www/host.d:/etc/nginx/conf.d -v $HERE/www/logs:/var/log/nginx -v $HERE/www/html:/var/www/html -v $HERE/www/htdocs:/var/www/localhost/htdocs"

if [ ! -z $ACTION ]; then
    case $ACTION in
        init)
            $MYSQLSCRIPT init $MYSQLINITFLAGS
            ;;

        status)
            $MYSQLSCRIPT status && $PHPFPMSCRIPT status && $NGINXSCRIPT status
            ;;

        start)
            if [ ! -z $SERVICE ]; then
                if [ $SERVICE = "mysql" -o $SERVICE = "all" ]; then
                    $MYSQLSCRIPT start $MYSQLSTARTFLAGS
                fi

                if [ $SERVICE = "phpfpm" -o $SERVICE = "all" ]; then
                    $PHPFPMSCRIPT start $PHPFPMFLAGS
                fi

                if [ $SERVICE = "nginx" -o $SERVICE = "all" ]; then
                    $NGINXSCRIPT start $NGINXFLAGS
                fi
            fi
            ;;

        stop)
            if [ ! -z $SERVICE ]; then
                if [ $SERVICE = "nginx" -o $SERVICE = "all" ]; then
                    $NGINXSCRIPT stop
                fi

                if [ $SERVICE = "phpfpm" -o $SERVICE = "all" ]; then
                    $PHPFPMSCRIPT stop
                fi

                if [ $SERVICE = "mysql" -o $SERVICE = "all" ]; then
                    $MYSQLSCRIPT stop
                fi
            fi
            ;;

        restart)
            if [ ! -z $SERVICE ]; then
                if [ $SERVICE = "mysql" -o $SERVICE = "all" ]; then
                    $MYSQLSCRIPT restart $MYSQLSTARTFLAGS
                fi

                if [ $SERVICE = "phpfpm" -o $SERVICE = "all" ]; then
                    $PHPFPMSCRIPT restart $PHPFPMFLAGS
                fi

                if [ $SERVICE = "nginx" -o $SERVICE = "all" ]; then
                    $NGINXSCRIPT restart $NGINXFLAGS
                fi
            fi
            ;;

        shell)
            if [ ! -z $SERVICE ]; then
                if [ $SERVICE = "nginx" ]; then
                    $NGINXSCRIPT shell
                fi

                if [ $SERVICE = "phpfpm" ]; then
                    $PHPFPMSCRIPT shell
                fi

                if [ $SERVICE = "mysql" ]; then
                    $MYSQLSCRIPT shell
                fi
            fi
            ;;
    esac
else
    echo "Usage: $LINK <ACTION> [SERVICE]"
    echo "  ACTION: <init/status/start/stop/restart/shell>"
    echo "  SERVICE: <all/nginx/phpfpm/mysql>"
fi

exit 0
