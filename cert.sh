#!/usr/bin/env bash

LINK="$0"
FILE="$(readlink -f -- $LINK)"
HERE="$(dirname $FILE)"

if [ $# -ne 1 ]; then
    echo "Usage: $LINK <ACTION>"
    echo "  ACTION: <certonly/renew>"
    exit 1
fi

ACTION="$1"

CERTBOTSCRIPT="$HERE/certbot/docker.sh"
CERTBOTFLAGS="-v $HERE/www/html:/var/www/html -v $HERE/www/ssl:/var/www/ssl"

case $ACTION in
    certonly)
        $CERTBOTSCRIPT certonly $CERTBOTFLAGS
        ;;

    renew)
        $CERTBOTSCRIPT renew $CERTBOTFLAGS
        ;;
esac

exit 0
