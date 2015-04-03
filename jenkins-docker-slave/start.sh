#!/bin/sh
docker run -d \
	--privileged \
	-v /var/run/docker.sock:/var/run/docker.sock \
	jenkins-docker-slave
