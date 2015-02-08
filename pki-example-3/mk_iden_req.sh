#!/usr/bin/env ksh
#   
cat iden_pass.txt | \
/usr/sbin/openssl req -new \
    -config etc/identity.conf \
    -subj '/C=SE/O=Blue AB/CN=Fred Flintstone/emailAddress=fred@blue.se' \
    -passout fd:0 \
    -out certs/fred-id.csr \
    -keyout certs/fred-id.key
