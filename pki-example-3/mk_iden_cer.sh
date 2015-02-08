#!/usr/bin/env ksh
#   
cat idenca_pass.txt | \
/usr/sbin/openssl ca \
    -config etc/identity-ca.conf \
    -passin fd:0 \
    -batch \
    -in certs/fred-id.csr \
    -out certs/fred-id.crt \
    -extensions identity_ext
