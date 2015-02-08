#!/usr/bin/env ksh
#
cp /dev/null ca/identity-ca/db/identity-ca.db
cp /dev/null ca/identity-ca/db/identity-ca.db.attr

echo 01> ca/identity-ca/db/identity-ca.crt.srl
echo 01> ca/identity-ca/db/identity-ca.crl.srl
