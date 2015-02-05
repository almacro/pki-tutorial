#!/usr/bin/env ksh
#
cat tlsca_pass.txt | \
/usr/sbin/openssl ca \
    -config etc/tls-ca.conf \
    -passin fd:0 \
    -revoke ca/tls-ca/01.pem \
    -crl_reason superseded
