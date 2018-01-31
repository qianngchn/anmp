#!/usr/bin/env bash
set -o errexit

ACTION="$1"; shift; FLAGS="$@"

DOCKER="docker"
USERNAME="qianngchn"
IMAGENAME="mysql"
CONTAINER="mysql"
USERIMAGE="$USERNAME/$IMAGENAME"
RUNFLAGS="--name $CONTAINER -p 3306:3306 $FLAGS"
SHELL="sh"

if [ ! -z $ACTION ]; then
    case $ACTION in
        init)
            $DOCKER run -it --rm $RUNFLAGS $USERIMAGE init
            ;;

        start)
            $DOCKER run --detach $RUNFLAGS $USERIMAGE start
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
