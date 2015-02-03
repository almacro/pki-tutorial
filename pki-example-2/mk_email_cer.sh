#!/usr/bin/env ksh
#
cat emailca_pass.txt | \
/usr/sbin/openssl ca \
    -config etc/email-ca.conf \
    -passin fd:0 \
    -batch \
    -in certs/fred.csr \
    -out certs/fred.crt \
    -extensions email_ext
