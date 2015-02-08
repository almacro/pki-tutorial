#!/usr/bin/env ksh
#
cat netca_pass.txt | \
/usr/sbin/openssl req -new \
    -config etc/network-ca.conf \
    -passout fd:0 \
    -out ca/network-ca.csr \
    -keyout ca/network-ca/private/network-ca.key
