#!/bin/sh

ssh-keygen -q -t rsa -f ssh_host_rsa_key -C '' -N ''
ssh-keygen -q -t dsa -f ssh_host_dsa_key -C '' -N ''

ssh-keygen -f hudson_id_rsa -N ""

