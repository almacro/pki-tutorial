#!/usr/bin/env ksh
#
cat compca_pass.txt | \
/usr/sbin/openssl ca \
    -config etc/component-ca.conf \
    -passin fd:0 \
    -batch \
    -in certs/ocsp.csr \
    -out certs/ocsp.crt \
    -extensions ocspsign_ext \
    -days 14
