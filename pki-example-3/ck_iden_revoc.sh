#!/usr/bin/env ksh
#
/usr/sbin/openssl crl -text -noout -in crl/identity-ca.crl | grep 'No Revoked Cert'  
