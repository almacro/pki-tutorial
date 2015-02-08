#!/usr/bin/env ksh
#   
cat idenca_pass.txt | \
/usr/sbin/openssl ca \
    -config etc/identity-ca.conf \
    -passin fd:0 \
    -batch \
    -in certs/fred-enc.csr \
    -out certs/fred-enc.crt \
    -extensions encryption_ext
