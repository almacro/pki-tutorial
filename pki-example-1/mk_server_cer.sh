#!/usr/bin/env ksh
#
cat signca_pass.txt | \
/usr/sbin/openssl ca \
    -config etc/signing-ca.conf \
    -passin fd:0 \
    -batch \
    -in certs/simple.org.csr \
    -out certs/simple.org.crt \
    -extensions server_ext
