#!/usr/bin/env ksh

TS=`date +'%Y%m%d-%H%M%S'`
LOG=run_${TS}.log
cp /dev/null $LOG

function check {
  [ $1 -ne 0 ] && { echo 'FAILED!'; exit 1; } || echo 'OK'
}
function skip {
  echo "SKIPPED"
}


#
# create root ca
#

echo -n 'creating RootCA dirs... '
if ! [ -d ca/root-ca ]
then
  sh mk_rootca_dirs.sh >> $LOG 2>&1
  check $?
else
  skip
fi

## create database
echo -n 'creating RootCA db... '
if ! [ -e ca/root-ca/db/root-ca.db ]
then
  sh mk_rootca_db.sh >> $LOG 2>&1
  check $?
else
  skip
fi

## create ca request
echo -n 'creating RootCA certificate request... '
if ! [ -e ca/root-ca.csr ]
then
  sh mk_rootca_req.sh >> $LOG 2>&1
  check $?
else
  skip
fi

## create ca certificate
echo -n 'creating RootCA certificate... '
if ! [ -e ca/root-ca.crt ]
then
  sh mk_rootca_cer.sh >> $LOG 2>&1
  check $?
else
  skip
fi

## create initial crl
echo -n 'initializing cert revoc list (CRL) for RootCA... '
if ! [ -e crl/root-ca.crl ]
then
  sh mk_rootca_crl.sh >> $LOG 2>&1
  check $?
else
  skip
fi

#
# create network ca
#

## create directories
echo -n 'creating NetworkCA dirs... '
if ! [ -d ca/network-ca ]
then
  sh mk_netca_dirs.sh >> $LOG 2>&1
  check $?
else
  skip
fi

## create database
echo -n 'creating NetworkCA db...'
if ! [ -e ca/network-ca/db/network-ca.db ]
then
  sh mk_netca_db.sh >> $LOG 2>&1
  check $?
else
  skip
fi

## create ca request

## create ca certificate

## create initial crl

## create pem bundle

#
# create identity ca
#

## create directories

## create database

## create ca request

## create ca certificate

## create initial crl

## create pem bundle

#
# create component ca
#

## create directories

## create database

## create ca request

## create ca certificate

## create initial crl

## create pem bundle

#
# operate identity ca
#

## create identity request

## create identity certificate

## create pkcs#12 bundle

## create encryption request

## create encryption certificate

## create pkcs#12 bundle

## revoke certificate

## create crl

#
# operate component ca
#

## create tls server request

## create tls server certificate

## create tls client request

## create tls client certificate

## create time-stamping request

## create time-stamping certificate

## create ocsp-signing request

## create ocsp-signing certificate

## revoke certificate

## create crl

#
# publish certificates
#

## create der certificate

## create der crl

## create pkcs#7 bundle

