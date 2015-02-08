#!/usr/bin/env ksh
#
cat idenca_pass.txt | \
/usr/sbin/openssl req -new \
    -config etc/identity-ca.conf \
    -passout fd:0 \
    -out ca/identity-ca.csr \
    -keyout ca/identity-ca/private/identity-ca.key
