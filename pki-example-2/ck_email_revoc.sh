#!/usr/bin/env ksh
#
/usr/sbin/openssl crl -text -noout -in crl/email-ca.crl | grep 'No Revoked Cert'
