Jenkins Docker slave
====================

A Jenkins Docker slave (running in Docker). This is a jenkins slave with the ability to run Docker on its host.

Build
-----

1. Create SSH keys for the SSH server and hudson slave, either by copying from elsewhere or by running `generate_keys.sh`.
2. Build: `docker build -t jenkins-docker-slave .`
3. Run the slave: `./start.sh`

