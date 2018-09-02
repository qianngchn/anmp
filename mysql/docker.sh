#!/usr/bin/env bash

LINK="$0"
FILE="$(readlink -f -- $LINK)"
HERE="$(dirname $FILE)"

if [ $# -lt 1 ]; then
    echo "Usage: $LINK <ACTION> [FLAGS]"
    echo "  ACTION: <init/status/start/stop/restart/shell>"
    exit 1
fi

ACTION="$1"; shift; FLAGS="$@"

DOCKER="docker"
USERNAME="qianngchn"
IMAGENAME="mysql"
CONTAINER="mysql"
USERIMAGE="$USERNAME/$IMAGENAME"
FLAGS="--name $CONTAINER -p 3306:3306 $FLAGS"
SHELL="sh"

case $ACTION in
    init)
        $DOCKER run -it --rm $FLAGS $USERIMAGE init
        ;;

    status)
        $DOCKER ps -a -f name=$CONTAINER | grep $CONTAINER
        ;;

    start)
        $DOCKER run --detach $FLAGS $USERIMAGE start
        ;;

    stop)
        $DOCKER stop $CONTAINER
        $DOCKER rm $CONTAINER
        ;;

    restart)
        $DOCKER stop $CONTAINER
        $DOCKER rm $CONTAINER
        $DOCKER run --detach $FLAGS $USERIMAGE start
        ;;

    shell)
        $DOCKER exec -it $CONTAINER $SHELL
        ;;
esac

exit 0
