#!/usr/bin/env ksh
#
cat ca/email-ca.crt ca/root-ca.crt > \
    ca/email-ca-chain.pem
