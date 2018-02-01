#!/usr/bin/env bash
set -o errexit

ACTION="$1"; shift; FLAGS="$@"

DOCKER="docker"
USERNAME="qianngchn"
IMAGENAME="phpfpm"
CONTAINER="phpfpm"
USERIMAGE="$USERNAME/$IMAGENAME"
FLAGS="--detach --name $CONTAINER -p 9000:9000 $FLAGS"
SHELL="sh"

if [ ! -z $ACTION ]; then
    case $ACTION in
        start)
            $DOCKER run $FLAGS $USERIMAGE
            ;;

        stop)
            $DOCKER stop $CONTAINER
            $DOCKER rm $CONTAINER
            ;;

        shell)
            $DOCKER exec -it $CONTAINER $SHELL
            ;;
    esac
fi

exit 0
