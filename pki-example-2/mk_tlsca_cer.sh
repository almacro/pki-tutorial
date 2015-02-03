#!/usr/bin/env ksh
#
cat rootca_pass.txt | \
/usr/sbin/openssl ca \
    -config etc/root-ca.conf \
    -passin fd:0 \
    -batch \
    -in ca/tls-ca.csr \
    -out ca/tls-ca.crt \
    -extensions signing_ca_ext
