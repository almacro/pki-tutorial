#!/usr/bin/env ksh
#
cat tlsca_pass.txt | \
/usr/sbin/openssl ca \
    -config etc/tls-ca.conf \
    -passin fd:0 \
    -batch \
    -in certs/green.no.csr \
    -out certs/green.no.crt \
    -extensions server_ext
