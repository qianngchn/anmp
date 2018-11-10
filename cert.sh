#!/usr/bin/env bash

LINK="$0"
FILE="$(readlink -f -- $LINK)"
HERE="$(dirname $FILE)"

if [ $# -ne 1 ]; then
    echo "Usage: $LINK <ACTION>"
    echo "  ACTION: <fetch/renew>"
    exit 1
fi

ACTION="$1"

SCRIPT="$HERE/certbot/docker.sh"
FLAGS="-v $HERE/www/html:/var/www/html -v $HERE/www/ssl:/etc/letsencrypt"

case $ACTION in
    fetch)
        $SCRIPT fetch $FLAGS
        ;;

    renew)
        $SCRIPT renew $FLAGS
        ;;
esac

exit 0
