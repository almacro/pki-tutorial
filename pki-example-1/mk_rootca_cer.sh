#!/usr/bin/env ksh
#
cat rootca_pass.txt | \
/usr/sbin/openssl ca -selfsign \
    -config etc/root-ca.conf \
    -passin fd:0 \
    -batch \
    -in ca/root-ca.csr \
    -out ca/root-ca.crt \
    -extensions root_ca_ext
