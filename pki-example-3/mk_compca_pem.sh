#!/usr/bin/env ksh
#
cat ca/component-ca.crt ca/network-ca-chain.pem > \
    ca/component-ca-chain.pem
