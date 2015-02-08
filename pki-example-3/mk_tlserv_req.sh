#!/usr/bin/env ksh
# 
SAN=DNS:blue.se,DNS:www.blue.se \
/usr/sbin/openssl req -new \
    -config etc/server.conf \
    -subj '/C=SE/O=Blue AB/CN=www.blue.se' \
    -out certs/blue.se.csr \
    -keyout certs/blue.se.key
