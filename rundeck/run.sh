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

if [ -z "$SERVER_HOSTNAME" ]; then
	SERVER_HOSTNAME=$(hostname)
fi

echo "Server hostname: $SERVER_HOSTNAME"

if [ ! -e /etc/rundeck/ssl/keystore ]; then
	echo "Creating self-signed keystore"
	keytool -keystore /etc/rundeck/ssl/keystore -alias rundeck -genkey -keyalg RSA -keypass adminadmin -storepass adminadmin  <<EOF
$SERVER_HOSTNAME
omedev
OME
Dundee
Scotland
UK
yes
EOF

	if [ ! -e /etc/rundeck/ssl/truststore ]; then
		cp /etc/rundeck/ssl/keystore /etc/rundeck/ssl/truststore
	fi
fi

source /etc/rundeck/profile

sed -i -r \
	-e "s|(framework.server.name =).*|\1 $SERVER_HOSTNAME|" \
	-e "s|(framework.server.hostname =).*|\1 $SERVER_HOSTNAME|" \
	-e "s|(framework.server.port =).*|\1 $RDECK_HTTPS_PORT|" \
	-e "s|(framework.server.url =).*|\1 https://$SERVER_HOSTNAME:$RDECK_HTTPS_PORT|" \
	/etc/rundeck/framework.properties
sed -i -r \
	-e "s|(grails.serverURL=).*|\1https://$SERVER_HOSTNAME:$RDECK_HTTPS_PORT|" \
	/etc/rundeck/rundeck-config.properties
rundeckd="${JAVA_HOME:-/usr}/bin/java ${RDECK_JVM} -cp ${BOOTSTRAP_CP} com.dtolabs.rundeck.RunServer /var/lib/rundeck ${RDECK_HTTP_PORT}"

exec $rundeckd
