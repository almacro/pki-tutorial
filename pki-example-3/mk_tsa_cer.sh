#!/usr/bin/env ksh
#
cat compca_pass.txt | \
/usr/sbin/openssl ca \
    -config etc/component-ca.conf \
    -passin fd:0 \
    -batch \
    -in certs/tsa.csr \
    -out certs/tsa.crt \
    -extensions timestamp_ext \
    -days 1826
