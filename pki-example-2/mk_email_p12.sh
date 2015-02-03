#!/usr/bin/env ksh
#

#cat p12_pass.txt | ( \

#
#  -passout fd:3 \
  cat email_pass.txt | \
  /usr/sbin/openssl pkcs12 -export \
  -name "Fred Flintstone (Email Security)" \
  -caname "Green Email CA" \
  -caname "Green Root CA" \
  -passin fd:0 \
  -inkey certs/fred.key \
  -in certs/fred.crt \
  -certfile ca/email-ca-chain.pem \
  -out certs/fred.p12 \
#) 3<&0
