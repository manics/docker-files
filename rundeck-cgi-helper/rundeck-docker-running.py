#!/usr/bin/env python

import cgi
import dns.resolver
import re

ps = cgi.FieldStorage()
d = ps.getvalue('dockerdomain')
if not d:
    raise Exception('dockerdomain not defined')
q = '*.%s' % d

pat = ps.getvalue('namere')
if not pat:
    pat = '.*'
if pat[-1] != '$':
    pat += '$'

ans = dns.resolver.Resolver().query(q, rdtype='SRV').rrset

nvs = []
for a in ans:
    parts = a.target.labels
    info, extname = parts[:2]
    intname = info.split(':')[1]
    if re.match(pat, extname):
        nvs.append('{ "name": "%s", "value": "%s" }' % (extname, intname))

print ('Content-type: application/json\n')
print ('[%s]' % ','.join(nvs))

