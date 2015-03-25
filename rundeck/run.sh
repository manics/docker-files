#!/bin/sh

source /etc/rundeck/profile

rundeckd="${JAVA_HOME:-/usr}/bin/java ${RDECK_JVM} -cp ${BOOTSTRAP_CP} com.dtolabs.rundeck.RunServer /var/lib/rundeck ${RDECK_HTTP_PORT}"

cp /config/* /etc/rundeck/ && echo "Copied config files" || echo No config files
exec $rundeckd
