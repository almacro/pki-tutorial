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

## create directories
echo -n 'creating RootCA dirs... '
if ! [ -d ca ]
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

#
# create signing ca
#

## create directories
echo -n 'creating SignCA dirs... '
if ! [ -d ca/signing-ca ]
then
  sh mk_signca_dirs.sh >> $LOG 2>&1
  check $?
else
  skip
fi

## create database
echo -n 'creating SignCA db... '
if ! [ -e ca/signing-ca/db/signing-ca.db ]
then
  sh mk_signca_db.sh >> $LOG 2>&1
  check $?
else
  skip
fi

## create ca request
echo -n 'creating SignCA certificate request... '
if ! [ -e ca/signing-ca.csr ]
then
  sh mk_signca_req.sh >> $LOG 2>&1
  check $?
else
  skip
fi

## create ca certificate
echo -n 'creating SignCA certificate... '
if ! [ -e ca/signing-ca.crt ]
then
  sh mk_signca_cer.sh >> $LOG 2>&1
  check $?
else
  skip
fi

#
# operate signing ca
#

## create email request
echo -n 'creating email-protection certificate request... '
if ! [ -e certs/fred.csr ]
then
  sh mk_email_req.sh >> $LOG 2>&1
  check $?
else
  skip
fi

## create email certificate
echo -n 'creating email-protection certificate... '
if ! [ -e certs/fred.crt ]
then
  sh mk_email_cer.sh >> $LOG 2>&1
  check $?
else
  skip
fi

## create tls server request
echo -n 'creating TLS server certificate request... '
if ! [ -e certs/simple.org.csr ]
then
  sh mk_server_req.sh >> $LOG 2>&1
  check $?
else
  skip
fi

## create tls server certificate
echo -n 'creating TLS server certificate... '
if ! [ -e certs/simple.org.crt ]
then
  sh mk_server_cer.sh >> $LOG 2>&1
  check $?
else
  skip
fi

## revoke certificate
echo -n 'revoking certificate with serial#=0x01... '
if [ -e ca/signing-ca/01.pem ]
then
  sh rev_01_cer.sh >> $LOG 2>&1
  check $?
else
  skip
fi

## create crl
echo -n 'creating cert revoc list (CRL)... '
if [ -e ca/signing-ca/01.pem ]
then
  sh mk_signca_crl.sh >> $LOG 2>&1
  check $?
else
  skip
fi

#
# output formats
#

## create der cert
echo -n 'creating DER form of certificate... '
if [ -e certs/fred.crt ]
then
  sh mk_email_der.sh >> $LOG 2>&1
  check $?
else
  skip
fi

## create der crl
echo -n 'creating DER form of CRL... '
if [ -e crl/signing-ca.crl ]
then
  sh mk_crl_der.sh >> $LOG 2>&1
  check $?
else
  skip
fi

## create pkcs#7 bundle
echo -n 'creating PKCS#7 bundle for SigningCA... '
if [ -e ca/signing-ca.crt ]
then
  sh mk_signca_p7.sh >> $LOG 2>&1
  check $?
else
  skip
fi

## create pkcs#12bundle
echo -n 'creating PKCS#12 bundle for email protection... '
if [ -e certs/fred.crt ]
then
  sh mk_email_p12.sh >> $LOG 2>&1
  check $?
else
  skip
fi

## create pem bundle
echo -n 'creating PEM bundle for Signing CA... '
if [ -e ca/signing-ca.crt ]
then
  sh mk_signca_pem.sh >> $LOG 2>&1
  check $?
else
  skip
fi
echo -n 'creating PEM bundle for email protection... '
if [ -e certs/fred.crt ]
then
  sh mk_email_pem.sh >> $LOG 2>&1
  check $?
else
  skip
fi

#
# view results
#

## view request
echo -n 'viewing email-protection certificate request... '
if [ -e certs/fred.csr ]
then
  sh vw_email_req.sh >> $LOG 2>&1
  check $?
else
  skip
fi

## view cert
echo -n 'viewing email-protection certificate... '
if [ -e certs/fred.crt ]
then
  sh vw_email_cer.sh >> $LOG 2>&1
  check $?
else
  skip
fi

## view crl
echo -n 'viewing SignCA cert revoc list (CRL)... '
if [ -e crl/signing-ca.crl ]
then
  sh vw_signca_crl.sh >> $LOG 2>&1
  check $?
else
  skip
fi

## view pkcs#7 bundle
echo -n 'viewing SignCA PKCS#7 bundle... '
if [ -e ca/signing-ca-chain.p7c ]
then
  sh vw_signca_p7.sh >> $LOG 2>&1
  check $?
else
  skip
fi

## view pkcs#12 bundle
echo -n 'viewing PKCS#12 bundle... '
if [ -e crl/signing-ca.crl ]
then
  sh vw_email_p12.sh >> $LOG 2>&1
  check $?
else
  skip
fi

