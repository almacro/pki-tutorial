#!/usr/bin/env ksh
#
cat ca/network-ca.crt ca/root-ca.crt > \
    ca/network-ca-chain.pem
