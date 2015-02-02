#!/usr/bin/env ksh
#
/usr/sbin/openssl x509 \
    -in certs/fred.crt \
    -out certs/fred.cer \
    -outform der
