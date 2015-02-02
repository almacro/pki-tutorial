#!/usr/bin/env ksh
#

/usr/sbin/openssl req \
  -in certs/fred.csr \
  -noout \
  -text
