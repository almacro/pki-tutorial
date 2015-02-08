#!/usr/bin/env ksh
#
cat rootca_pass.txt | \
/usr/sbin/openssl ca \
    -config etc/root-ca.conf \
    -passin fd:0 \
    -batch \
    -in ca/network-ca.csr \
    -out ca/network-ca.crt \
    -extensions intermediate_ca_ext \
    -enddate 20301231235959Z
