#!/usr/bin/env ksh
# 
SAN=DNS:green.no,DNS:www.green.no \
/usr/sbin/openssl req -new \
    -config etc/server.conf \
    -subj '/C=NO/O=Green AS/CN=www.green.no' \
    -out certs/green.no.csr \
    -keyout certs/green.no.key
