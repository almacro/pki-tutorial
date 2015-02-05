#!/usr/bin/env ksh
#

cat p12_pass.txt | ( \
  cat soft_pass.txt | \
  /usr/sbin/openssl pkcs12 -export \
  -name "Green Software Certificate" \
  -caname "Green Software CA" \
  -caname "Green Root CA" \
  -passin fd:0 \
  -passout fd:3 \
  -inkey certs/software.key \
  -in certs/software.crt \
  -certfile ca/software-ca-chain.pem \
  -out certs/software.p12 \
) 3<&0
