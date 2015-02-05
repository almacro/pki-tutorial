#!/usr/bin/env ksh
#   
cat soft_pass.txt | \
/usr/sbin/openssl req -new \
    -config etc/codesign.conf \
    -subj '/C=NO/O=Green AS/OU=Green Certificate Authority/CN=Green Software Certificate' \
    -passout fd:0 \
    -out certs/software.csr \
    -keyout certs/software.key
