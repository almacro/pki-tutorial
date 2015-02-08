#!/usr/bin/env ksh
#
cat compca_pass.txt | \
/usr/sbin/openssl ca \
    -config etc/component-ca.conf \
    -passin fd:0 \
    -batch \
    -in certs/blue.se.csr \
    -out certs/blue.se.crt \
    -extensions server_ext
