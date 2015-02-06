#!/usr/bin/env ksh
#
cat emailca_pass.txt | \
/usr/sbin/openssl ca -gencrl \
    -config etc/email-ca.conf \
    -passin fd:0 \
    -out crl/email-ca.crl
