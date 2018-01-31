#!/usr/bin/env bash
set -o errexit

FLAGS="$@"

DOCKER="docker"
USERNAME="qianngchn"
IMAGENAME="alpine"
CONTAINER="alpine"
USERIMAGE="$USERNAME/$IMAGENAME"
RUNFLAGS="-it --rm --name $CONTAINER $FLAGS"

$DOCKER run $RUNFLAGS $USERIMAGE

exit 0
