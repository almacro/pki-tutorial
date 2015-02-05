#!/usr/bin/env ksh
#
/usr/sbin/openssl crl2pkcs7 -nocrl \
    -certfile ca/email-ca-chain.pem \
    -out ca/email-ca-chain.p7c \
    -outform der
