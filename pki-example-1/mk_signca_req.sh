#!/usr/bin/env ksh
#
cat signca_pass.txt | \
/usr/sbin/openssl req -new \
    -config etc/signing-ca.conf \
    -passout fd:0 \
    -out ca/signing-ca.csr \
    -keyout ca/signing-ca/private/signing-ca.key
