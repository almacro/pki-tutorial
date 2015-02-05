#!/usr/bin/env ksh
#
cat softca_pass.txt | \
/usr/sbin/openssl ca \
    -config etc/software-ca.conf \
    -passin fd:0 \
    -revoke ca/software-ca/01.pem \
    -crl_reason unspecified
