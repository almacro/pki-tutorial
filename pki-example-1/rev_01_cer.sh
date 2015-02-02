#!/usr/bin/env ksh
#
cat signca_pass.txt | \
/usr/sbin/openssl ca \
    -config etc/signing-ca.conf \
    -passin fd:0 \
    -revoke ca/signing-ca/01.pem \
    -crl_reason superseded
