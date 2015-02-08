#!/usr/bin/env ksh
#
cat tlscli_pass.txt | \
/usr/sbin/openssl req -new \
    -config etc/client.conf \
    -subj '/C=SE/O=Blue AB/CN=Blue Network Monitoring' \
    -passout fd:0 \
    -out certs/net-mon.csr \
    -keyout certs/net-mon.key
