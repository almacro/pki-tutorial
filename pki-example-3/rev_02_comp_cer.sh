#!/usr/bin/env ksh
#
cat compca_pass.txt | \
/usr/sbin/openssl ca \
    -config etc/component-ca.conf \
    -passin fd:0 \
    -revoke ca/component-ca/02.pem \
    -crl_reason superseded
