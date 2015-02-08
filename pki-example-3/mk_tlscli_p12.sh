#!/usr/bin/env ksh
#

cat p12_pass.txt | ( \
  cat tlscli_pass.txt | \
  /usr/sbin/openssl pkcs12 -export \
  -name "Barney Rubble (Network Access)" \
  -caname "Green TLS CA" \
  -caname "Green Root CA" \
  -passin fd:0 \
  -passout fd:3 \
  -inkey certs/barney.key \
  -in certs/barney.crt \
  -certfile ca/tls-ca-chain.pem \
  -out certs/barney.p12 \
) 3<&0
