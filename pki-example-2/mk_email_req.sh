#!/usr/bin/env ksh
#
cat email_pass.txt | \
/usr/sbin/openssl req -new \
    -config etc/email.conf \
    -subj '/C=NO/ST=Hordaland/L=Bergen/O=Green AS/CN=Fred Flintstone/emailAddress=fred@green.no' \
    -passout fd:0 \
    -out certs/fred.csr \
    -keyout certs/fred.key



