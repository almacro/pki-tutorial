#!/usr/bin/env ksh
#
SAN=DNS:www.simple.org \
/usr/sbin/openssl req -new \
    -config etc/server.conf \
    -subj '/DC=org/DC=simple/O=Simple Inc/CN=www.simple.org' \
    -out certs/simple.org.csr \
    -keyout certs/simple.org.key
