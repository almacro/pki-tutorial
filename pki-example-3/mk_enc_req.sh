#!/usr/bin/env ksh
#   
cat enc_pass.txt | \
/usr/sbin/openssl req -new \
    -config etc/encryption.conf \
    -subj '/C=SE/O=Blue AB/CN=Fred Flintstone/emailAddress=fred@blue.se' \
    -passout fd:0 \
    -out certs/fred-enc.csr \
    -keyout certs/fred-enc.key
