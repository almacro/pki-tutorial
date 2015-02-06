#!/usr/bin/env ksh
#
cat tlsca_pass.txt | \
/usr/sbin/openssl ca -gencrl \
    -config etc/tls-ca.conf \
    -passin fd:0 \
    -out crl/tls-ca.crl
