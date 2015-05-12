#!/bin/bash

cd /server

if [ $# -ne 2 -o -z "$1" -o -z "$2" ]; then
	echo "Usage: `basename $0` port domain"
	exit 1
fi

PORT="$1"
DOCKER_DOMAIN="$2"
export DOCKER_DOMAIN

exec python -m CGIHTTPServer "$PORT"
