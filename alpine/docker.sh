#!/usr/bin/env bash

DOCKER="docker"
USERNAME="qianngchn"
IMAGENAME="alpine"
CONTAINER="alpine"
USERIMAGE="$USERNAME/$IMAGENAME"
FLAGS="-it --rm --name $CONTAINER"

$DOCKER run $FLAGS $USERIMAGE

exit 0
