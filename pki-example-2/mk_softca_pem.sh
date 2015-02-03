#!/usr/bin/env ksh
#   
cat ca/software-ca.crt ca/root-ca.crt > \
    ca/software-ca-chain.pem
