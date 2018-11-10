#!/bin/sh

LINK="$0"
FILE="$(readlink -f -- $LINK)"
HERE="$(dirname $FILE)"

if [ $# -ne 1 ]; then
    echo "Usage: $LINK <ACTION>"
    echo "  ACTION: <certonly/renew>"
    exit 1
fi

ACTION="$1"

case $ACTION in
    certonly)
        certbot certonly
        ;;

    renew)
        certbot renew
        ;;
esac

exit 0
