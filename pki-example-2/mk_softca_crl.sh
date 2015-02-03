x#!/usr/bin/env ksh
#

cat softca_pass.txt | \
/usr/sbin/openssl ca -gencrl \
    -config etc/software-ca.conf \
    -passin fd:0 \
    -out crl/software-ca.crl
