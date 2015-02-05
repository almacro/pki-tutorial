#!/usr/bin/env ksh
#
cat tlsca_pass.txt | \
/usr/sbin/openssl ca \
    -config etc/tls-ca.conf \
    -passin fd:0 \
    -batch \
    -in certs/barney.csr \
    -out certs/barney.crt \
    -policy extern_pol \
    -extensions client_ext
