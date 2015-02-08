#!/usr/bin/env ksh
#
cat netca_pass.txt | \
/usr/sbin/openssl ca \
    -config etc/network-ca.conf \
    -passin fd:0 \
    -batch \
    -in ca/identity-ca.csr \
    -out ca/identity-ca.crt \
    -extensions signing_ca_ext
