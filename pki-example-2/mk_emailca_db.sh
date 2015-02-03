#!/usr/bin/env ksh
#
cp /dev/null ca/email-ca/db/email-ca.db
cp /dev/null ca/email-ca/db/email-ca.db.attr

echo 01> ca/email-ca/db/email-ca.crt.srl
echo 01> ca/email-ca/db/email-ca.crl.srl
