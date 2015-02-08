#!/usr/bin/env ksh
#
cat compca_pass.txt | \
/usr/sbin/openssl req -new \
    -config etc/component-ca.conf \
    -passout fd:0 \
    -out ca/component-ca.csr \
    -keyout ca/component-ca/private/component-ca.key
