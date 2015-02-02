#!/usr/bin/env ksh
#
cat email_pass.txt | \
/usr/sbin/openssl req -new \
    -config etc/email.conf \
    -subj '/DC=org/DC=simple/O=Simple Inc/CN=Fred Flintstone/emailAddress=fred@simple.org' \
    -passout fd:0 \
    -out certs/fred.csr \
    -keyout certs/fred.key



