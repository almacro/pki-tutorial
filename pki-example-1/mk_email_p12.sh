#!/usr/bin/env ksh
#

cat p12_pass.txt | ( \
  cat email_pass.txt | \
  /usr/sbin/openssl pkcs12 -export \
  -name "Fred Flintstone" \
  -passin fd:0 \
  -passout fd:3 \
  -inkey certs/fred.key \
  -in certs/fred.crt \
  -out certs/fred.p12 \
) 3<&0
