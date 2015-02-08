#!/usr/bin/env ksh
#
cp /dev/null ca/component-ca/db/component-ca.db
cp /dev/null ca/component-ca/db/component-ca.db.attr

echo 01> ca/component-ca/db/component-ca.crt.srl
echo 01> ca/component-ca/db/component-ca.crl.srl
