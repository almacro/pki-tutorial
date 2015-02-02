#!/usr/bin/env ksh
#

cat signca_pass.txt | \
/usr/sbin/openssl ca -gencrl \
    -config etc/signing-ca.conf \
    -passin fd:0 \
    -out crl/signing-ca.crl
