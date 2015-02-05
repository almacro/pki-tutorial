#!/usr/bin/env ksh
# 
/usr/sbin/openssl x509 \
    -in ca/root-ca.crt \
    -out ca/root-ca.cer \
    -outform der
