#!/usr/bin/env ksh
#
cp /dev/null ca/software-ca/db/software-ca.db
cp /dev/null ca/software-ca/db/software-ca.db.attr

echo 01> ca/software-ca/db/software-ca.crt.srl
echo 01> ca/software-ca/db/software-ca.crl.srl
