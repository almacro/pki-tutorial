#!/usr/bin/env ksh
#
cat p12_pass.txt | ( \
  cat email_pass.txt | \
  /usr/sbin/openssl pkcs12 -export \
  -name "green.no (Network Component)" \
  -caname "Green TLS CA" \
  -caname "Green Root CA" \
  -passin fd:0 \
  -passout fd:3 \
  -inkey certs/green.no.key \
  -in certs/green.no.crt \
  -certfile ca/tls-ca-chain.pem \
  -out certs/green.no.p12 \
) 3<&0
