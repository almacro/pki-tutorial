#!/usr/bin/env ksh
#
cat idenca_pass.txt | \
/usr/sbin/openssl ca -gencrl \
    -config etc/identity-ca.conf \
    -passin fd:0 \
    -out crl/identity-ca.crl
