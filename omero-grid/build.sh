#!/bin/sh
set -eu
SUFFIX=
if [ $# -ge 1 ]; then
	SUFFIX=-$1
fi

build() {
	rm -r build-tmp || true
	cp -a "$2" build-tmp
	sed -i "s/%SUFFIX%/$SUFFIX/" build-tmp/Dockerfile
	echo docker build -t "$1" build-tmp
	docker build -t "$1" build-tmp
}

# Postgres with an omero user and empty database
build manics/omero-grid-db$SUFFIX db

# All-in-one OMERO.server with all dependencies, also used as basis for other images
build manics/omero-grid-omero$SUFFIX omero

# OMERO.server excluding Processor
build manics/omero-grid-omero-server$SUFFIX omero-server

# Processor
build manics/omero-grid-omero-slave$SUFFIX omero-slave

# OMERO.web
build manics/omero-grid-omero-web$SUFFIX omero-web

