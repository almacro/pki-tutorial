#!/usr/bin/env ksh
#

cat rootca_pass.txt | \
/usr/sbin/openssl ca -gencrl \
    -config etc/root-ca.conf \
    -passin fd:0 \
    -out crl/root-ca.crl
