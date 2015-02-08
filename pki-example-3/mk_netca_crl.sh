#!/usr/bin/env ksh
#
cat netca_pass.txt | \
/usr/sbin/openssl ca -gencrl \
    -config etc/network-ca.conf \
    -passin fd:0 \
    -out crl/network-ca.crl
