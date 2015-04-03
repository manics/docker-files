#!/bin/sh

set -e

# Copy only files
FILES=$(find /config/ -maxdepth 1 -type f)
if [ -n "$FILES" ]; then
	echo "Copying config files: $FILES"
	cp $FILES /etc/rundeck/
fi
if [ -d /config/ssl/ ]; then
	FILES=$(find /config/ssl/ -maxdepth 1 -type f)
	if [ -n "$FILES" ]; then
		echo "Copying ssl config files: $FILES"
		cp $FILES /etc/rundeck/ssl/
	fi
fi

source /etc/rundeck/profile

if [ -n "$SERVER_HOSTNAME" ]; then
	RUNDECK_URL=https://$SERVER_HOSTNAME:$RDECK_HTTPS_PORT
	echo "Setting public URL to: $RUNDECK_URL"
	sed -i -r -e "s|(grails.serverURL=).*|\1$RUNDECK_URL|" \
		/etc/rundeck/rundeck-config.properties
fi

exec ${JAVA_HOME:-/usr}/bin/java ${RDECK_JVM} -cp ${BOOTSTRAP_CP} com.dtolabs.rundeck.RunServer /var/lib/rundeck ${RDECK_HTTP_PORT}

