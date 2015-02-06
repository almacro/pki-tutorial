#!/usr/bin/env ksh
#
cp /dev/null ca/network-ca/db/network-ca.db
cp /dev/null ca/network-ca/db/network-ca.db.attr

echo 01> ca/network-ca/db/network-ca.crt.srl
echo 01> ca/network-ca/db/network-ca.crl.srl
