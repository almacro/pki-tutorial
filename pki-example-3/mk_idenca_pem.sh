#!/usr/bin/env ksh
#
cat ca/identity-ca.crt ca/network-ca-chain.pem > \
    ca/identity-ca-chain.pem
