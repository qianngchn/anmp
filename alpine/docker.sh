#!/usr/bin/env bash
set -o errexit

FLAGS="$@"

DOCKER="docker"
USERNAME="qianngchn"
IMAGENAME="alpine"
CONTAINER="alpine"
USERIMAGE="$USERNAME/$IMAGENAME"
FLAGS="-it --rm --name $CONTAINER $FLAGS"

$DOCKER run $FLAGS $USERIMAGE

exit 0
