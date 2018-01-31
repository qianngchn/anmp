#!/usr/bin/env bash
set -o errexit

ACTION="$1"; shift; FLAGS="$@"

DOCKER="docker"
USERNAME="qianngchn"
IMAGENAME="nginx"
CONTAINER="nginx"
USERIMAGE="$USERNAME/$IMAGENAME"
RUNFLAGS="--detach --name $CONTAINER -p 80:80 $FLAGS"
SHELL="sh"

if [ ! -z $ACTION ]; then
    case $ACTION in
        start)
            $DOCKER run $RUNFLAGS $USERIMAGE
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
