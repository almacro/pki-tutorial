#!/usr/bin/env ksh
#
cat p12_pass.txt | ( \
  cat enc_pass.txt | \
  /usr/sbin/openssl pkcs12 -export \
  -name "Fred Flintstone (Blue Encryption)" \
  -caname "Blue Identity CA" \
  -caname "Blue Network CA" \
  -caname "Blue Root CA" \
  -passin fd:0 \
  -passout fd:3 \
  -inkey certs/fred-enc.key \
  -in certs/fred-enc.crt \
  -certfile ca/identity-ca-chain.pem \
  -out certs/fred-enc.p12 \
) 3<&0
