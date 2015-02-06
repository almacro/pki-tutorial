#!/usr/bin/env ksh
#
cat p12_pass.txt | ( \
  cat email_pass.txt | \
  /usr/sbin/openssl pkcs12 -export \
  -name "Fred Flintstone (Email Security)" \
  -caname "Green Email CA" \
  -caname "Green Root CA" \
  -passin fd:0 \
  -passout fd:3 \
  -inkey certs/fred.key \
  -in certs/fred.crt \
  -certfile ca/email-ca-chain.pem \
  -out certs/fred.p12 \
) 3<&0
