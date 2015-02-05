#!/usr/bin/env ksh
#
cat tlscli_pass.txt | \
/usr/sbin/openssl req -new \
    -config etc/client.conf \
    -subj '/C=NO/O=Telenor AS/OU=Support/CN=Barney Rubble/emailAddress=barney@telenor.no' \
    -passout fd:0 \
    -out certs/barney.csr \
    -keyout certs/barney.key
