#!/usr/bin/env bash
set -o errexit

ACTION="$1"; shift; FLAGS="$@"

DOCKER="docker"
USERNAME="qianngchn"
IMAGENAME="nginx"
CONTAINER="nginx"
USERIMAGE="$USERNAME/$IMAGENAME"
FLAGS="--detach --name $CONTAINER -p 80:80 $FLAGS"
SHELL="sh"

if [ ! -z $ACTION ]; then
    case $ACTION in
        status)
            $DOCKER ps -a -f name=$CONTAINER | grep $CONTAINER || true
            ;;

        start)
            $DOCKER run $FLAGS $USERIMAGE
            ;;

        stop)
            $DOCKER stop $CONTAINER
            $DOCKER rm $CONTAINER
            ;;

        restart)
            $DOCKER stop $CONTAINER
            $DOCKER rm $CONTAINER
            $DOCKER run $FLAGS $USERIMAGE
            ;;

        shell)
            $DOCKER exec -it $CONTAINER $SHELL
            ;;
    esac
fi

exit 0
