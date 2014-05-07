#!/bin/sh
set -eu
SUFFIX=
if [ $# -ge 1 ]; then
        SUFFIX=-$1
fi

docker rm -f \
	omero-grid-db$SUFFIX \
	omero-grid-omero$SUFFIX \
	omero-grid-omero-server$SUFFIX \
	omero-grid-omero-slave$SUFFIX \
	omero-grid-omero-web$SUFFIX

