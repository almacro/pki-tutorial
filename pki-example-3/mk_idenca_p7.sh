#!/usr/bin/env ksh
#
/usr/sbin/openssl crl2pkcs7 -nocrl \
    -certfile ca/identity-ca-chain.pem \
    -out ca/identity-ca-chain.p7c \
    -outform der
