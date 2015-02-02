#!/usr/bin/env ksh
#

/usr/sbin/openssl crl \
    -in crl/signing-ca.crl \
    -inform der \
    -noout \
    -text
