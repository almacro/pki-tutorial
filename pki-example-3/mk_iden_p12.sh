#!/usr/bin/env ksh
#
cat p12_pass.txt | ( \
  cat iden_pass.txt | \
  /usr/sbin/openssl pkcs12 -export \
  -name "Fred Flintstone (Blue Identity)" \
  -caname "Blue Identity CA" \
  -caname "Blue Network CA" \
  -caname "Blue Root CA" \
  -passin fd:0 \
  -passout fd:3 \
  -inkey certs/fred-id.key \
  -in certs/fred-id.crt \
  -certfile ca/identity-ca-chain.pem \
  -out certs/fred-id.p12 \
) 3<&0
