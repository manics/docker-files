#!/bin/sh
set -eu
SUFFIX=
if [ $# -ge 1 ]; then
        SUFFIX=-$1
fi

docker run -d -p 5432:5432 --name omero-grid-db$SUFFIX manics/omero-grid-db

docker run -d -p 4061:4061 -p 4063:4063 -p 4064:4064 \
	--link omero-grid-db$SUFFIX:db --name omero-grid-omero-server$SUFFIX \
	 manics/omero-grid-omero-server$SUFFIX

docker run -d --link omero-grid-omero-server$SUFFIX:master \
	--name omero-grid-omero-slave$SUFFIX \
	manics/omero-grid-omero-slave$SUFFIX

docker run -d -p 8080:80 --link omero-grid-omero-server$SUFFIX:master \
	--name omero-grid-omero-web$SUFFIX manics/omero-grid-omero-web$SUFFIX

