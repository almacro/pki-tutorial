#!/usr/bin/env ksh
#
cat rootca_pass.txt | \
/usr/sbin/openssl req -new \
    -config etc/root-ca.conf \
    -passout fd:0 \
    -out ca/root-ca.csr \
    -keyout ca/root-ca/private/root-ca.key
