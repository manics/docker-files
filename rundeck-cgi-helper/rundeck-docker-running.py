#!/usr/bin/env python

import dns.resolver
import os

try:
    q = '*.%s' % os.environ['DOCKER_DOMAIN']
except KeyError:
    raise Exception('DOCKER_DOMAIN not defined')

ans = dns.resolver.Resolver().query(q, rdtype='SRV').rrset

nvs = []
for a in ans:
    parts = a.target.labels
    assert parts[2:] == ('docker', 'openmicroscopy', 'org', '')
    info, extname = parts[:2]
    intname = info.split(':')[1]
    nvs.append('{ "name": "%s", "value": "%s" }' % (extname, intname))

print ('Content-type: application/json\n')
print ('[%s]' % ','.join(nvs))

