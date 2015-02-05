#!/usr/bin/env ksh
#
cat emailca_pass.txt | \
/usr/sbin/openssl ca \
    -config etc/email-ca.conf \
    -passin fd:0 \
    -revoke ca/email-ca/01.pem \
    -crl_reason superseded
