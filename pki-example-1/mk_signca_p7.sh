#!/usr/bin/env ksh
#
/usr/sbin/openssl crl2pkcs7 -nocrl \
    -certfile ca/signing-ca.crt \
    -certfile ca/root-ca.crt \
    -out ca/signing-ca-chain.p7c \
    -outform der
