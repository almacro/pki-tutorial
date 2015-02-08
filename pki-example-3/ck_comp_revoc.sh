#!/usr/bin/env ksh
#
/usr/sbin/openssl crl -text -noout -in crl/component-ca.crl | grep 'No Revoked Cert'  
