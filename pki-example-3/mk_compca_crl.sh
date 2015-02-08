#!/usr/bin/env ksh
#
cat compca_pass.txt | \
/usr/sbin/openssl ca -gencrl \
    -config etc/component-ca.conf \
    -passin fd:0 \
    -out crl/component-ca.crl
