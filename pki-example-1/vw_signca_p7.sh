#!/usr/bin/env ksh
#

/usr/sbin/openssl pkcs7 \
    -in ca/signing-ca-chain.p7c \
    -inform der \
    -noout \
    -text \
    -print_certs
