#!/usr/bin/env ksh
#

cat p12_pass.txt | \
/usr/sbin/openssl pkcs12 \
    -in certs/fred.p12 \
    -passin fd:0 \
    -nodes \
    -info
