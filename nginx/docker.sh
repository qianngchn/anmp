#!/usr/bin/env bash

LINK="$0"
FILE="$(readlink -f -- $LINK)"
HERE="$(dirname $FILE)"

if [ $# -lt 1 ]; then
    echo "Usage: $LINK <ACTION> [FLAGS]"
    echo "  ACTION: <status/start/stop/restart/shell>"
    exit 1
fi

ACTION="$1"; shift; FLAGS="$@"

DOCKER="docker"
USERNAME="qianngchn"
IMAGENAME="nginx"
CONTAINER="nginx"
USERIMAGE="$USERNAME/$IMAGENAME"
FLAGS="--detach --name $CONTAINER -p 80:80 $FLAGS"
SHELL="sh"

case $ACTION in
    status)
        $DOCKER ps -a -f name=$CONTAINER | grep $CONTAINER
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

exit 0
