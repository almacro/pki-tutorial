#!/usr/bin/env ksh
#
cat softca_pass.txt | \
/usr/sbin/openssl req -new \
    -config etc/software-ca.conf \
    -passout fd:0 \
    -out ca/software-ca.csr \
    -keyout ca/software-ca/private/software-ca.key
