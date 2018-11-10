#!/bin/sh

LINK="$0"
FILE="$(readlink -f -- $LINK)"
HERE="$(dirname $FILE)"

if [ $# -ne 1 ]; then
    echo "Usage: $LINK <ACTION>"
    echo "  ACTION: <fetch/renew>"
    exit 1
fi

ACTION="$1"

case $ACTION in
    fetch)
        certbot certonly --webroot --agree-tos
        ;;

    renew)
        certbot renew
        ;;
esac

exit 0
