#!/usr/bin/env ksh
#
cat ca/signing-ca.crt ca/root-ca.crt > \
    ca/signing-ca-chain.pem
