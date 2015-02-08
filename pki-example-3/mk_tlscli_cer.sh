#!/usr/bin/env ksh
#
cat compca_pass.txt | \
/usr/sbin/openssl ca \
    -config etc/component-ca.conf \
    -passin fd:0 \
    -batch \
    -in certs/net-mon.csr \
    -out certs/net-mon.crt \
    -extensions client_ext
