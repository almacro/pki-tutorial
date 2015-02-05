#!/usr/bin/env ksh
#
/usr/sbin/openssl crl \
    -in crl/email-ca.crl \
    -out crl/email-ca.crl \
    -outform der
