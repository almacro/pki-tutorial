#!/usr/bin/env ksh
#
/usr/sbin/openssl crl \
    -in crl/network-ca.crl \
    -out crl/networkx-ca.crl \
    -outform der
