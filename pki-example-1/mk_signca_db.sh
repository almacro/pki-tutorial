#!/usr/bin/env ksh
#
cp /dev/null ca/signing-ca/db/signing-ca.db
cp /dev/null ca/signing-ca/db/signing-ca.db.attr

echo 01 > ca/signing-ca/db/signing-ca.crt.srl
echo 01 > ca/signing-ca/db/signing-ca.crl.srl
