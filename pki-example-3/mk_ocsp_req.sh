#!/usr/bin/env ksh
#
cat ocsp_pass.txt | \
/usr/sbin/openssl req -new \
    -config etc/ocspsign.conf \
    -subj '/C=SE/O=Blue AB/CN=Blue OCSP Responder' \
    -passout fd:0 \
    -out certs/ocsp.csr \
    -keyout certs/ocsp.key
