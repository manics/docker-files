#!/bin/bash

cd /server

if [ $# -ne 1 -o -z "$1" ]; then
	echo "Usage: `basename $0` port"
	exit 1
fi

exec python -m CGIHTTPServer "$1"
