#!/usr/bin/env ksh
#
/usr/sbin/openssl crl -text -noout -in crl/software-ca.crl | grep 'No Revoked Cert'  
