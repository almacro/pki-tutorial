#!/usr/bin/env ksh
#
cp /dev/null ca/tls-ca/db/tls-ca.db
cp /dev/null ca/tls-ca/db/tls-ca.db.attr

echo 01> ca/tls-ca/db/tls-ca.crt.srl
echo 01> ca/tls-ca/db/tls-ca.crl.srl
