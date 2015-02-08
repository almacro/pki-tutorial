#!/usr/bin/env ksh
#
cat tsa_pass.txt | \
/usr/sbin/openssl req -new \
    -config etc/timestamp.conf \
    -subj '/C=SE/O=Blue AB/OU=Blue TSA/CN=Blue TSA' \
    -passout fd:0 \
    -out certs/tsa.csr \
    -keyout certs/tsa.key
