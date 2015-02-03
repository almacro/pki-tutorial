#!/usr/bin/env ksh
#   
cat ca/tls-ca.crt ca/root-ca.crt > \
    ca/tls-ca-chain.pem
