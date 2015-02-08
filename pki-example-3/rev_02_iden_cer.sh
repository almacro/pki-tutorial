#!/usr/bin/env ksh
#
cat idenca_pass.txt | \
/usr/sbin/openssl ca \
    -config etc/identity-ca.conf \
    -passin fd:0 \
    -revoke ca/identity-ca/02.pem \
    -crl_reason superseded
