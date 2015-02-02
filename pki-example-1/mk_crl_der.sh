#!/usr/bin/env ksh
#
/usr/sbin/openssl crl \
    -in crl/signing-ca.crl \
    -out crl/signing-ca.crl \
    -outform der
