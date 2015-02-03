#!/usr/bin/env ksh
#
cat emailca_pass.txt | \
/usr/sbin/openssl req -new \
    -config etc/email-ca.conf \
    -passout fd:0 \
    -out ca/email-ca.csr \
    -keyout ca/email-ca/private/email-ca.key
