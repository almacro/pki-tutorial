#!/usr/bin/env ksh
#
cat tlsca_pass.txt | \
/usr/sbin/openssl req -new \
    -config etc/tls-ca.conf \
    -passout fd:0 \
    -out ca/tls-ca.csr \
    -keyout ca/tls-ca/private/tls-ca.key
