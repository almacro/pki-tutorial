#!/usr/bin/env ksh
#
cat netca_pass.txt | \
/usr/sbin/openssl ca \
    -config etc/network-ca.conf \
    -passin fd:0 \
    -batch \
    -in ca/component-ca.csr \
    -out ca/component-ca.crt \
    -extensions signing_ca_ext
