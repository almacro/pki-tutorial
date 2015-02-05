#!/usr/bin/env ksh
#
/usr/sbin/openssl crl -text -noout -in crl/tls-ca.crl | grep 'No Revoked Cert'
