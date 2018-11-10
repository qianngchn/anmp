#!/usr/bin/env bash

LINK="$0"
FILE="$(readlink -f -- $LINK)"
HERE="$(dirname $FILE)"

if [ $# -lt 1 ]; then
    echo "Usage: $LINK <ACTION> [FLAGS]"
    echo "  ACTION: <certonly/renew>"
    exit 1
fi

ACTION="$1"; shift; FLAGS="$@"

DOCKER="docker"
USERNAME="qianngchn"
IMAGENAME="certbot"
CONTAINER="certbot"
USERIMAGE="$USERNAME/$IMAGENAME"
FLAGS="--name $CONTAINER $FLAGS"
SHELL="sh"

case $ACTION in
    certonly)
        $DOCKER run -it --rm $FLAGS $USERIMAGE certonly
        ;;

    renew)
        $DOCKER run -it --rm $FLAGS $USERIMAGE renew
        ;;
esac

exit 0
