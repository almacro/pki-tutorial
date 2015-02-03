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
# create email ca
#

echo -n 'creating EmailCA dirs... '
if ! [ -d ca/email-ca ]
then
  sh mk_emailca_dirs.sh >> $LOG 2>&1
  check $?
else
  skip
fi

## create database
echo -n 'creating EmailCA db...'
if ! [ -e ca/email-ca/db/email-ca.db ]
then
  sh mk_emailca_db.sh >> $LOG 2>&1
  check $?
else
  skip
fi

## create ca request
echo -n 'creating EmailCA certificate request... '
if ! [ -e ca/email-ca.csr ]
then
  sh mk_emailca_req.sh >> $LOG 2>&1
  check $?
else
  skip
fi

## create ca certificate
echo -n 'creating EmailCA certificate... '
if ! [ -e ca/email-ca.crt ]
then
  sh mk_emailca_cer.sh >> $LOG 2>&1
  check $?
else
  skip
fi

## create initial crl
echo -n 'initializing cert revoc list (CRL) for EmailCA... '
if ! [ -e crl/email-ca.crl ]
then
  sh mk_emailca_crl.sh >> $LOG 2>&1
  check $?
else
  skip
fi

## create pem bundle
echo -n 'creating PEM bundle for EmailCA... '
if [ -e ca/email-ca.crt ]
then
  sh mk_emailca_pem.sh >> $LOG 2>&1
  check $?
else
  skip
fi

#
# create tls ca
#

## create directories
echo -n 'creating TLS CA dirs... '
if ! [ -d ca/tls-ca ]
then
  sh mk_tlsca_dirs.sh >> $LOG 2>&1
  check $?
else
  skip
fi

## create database
echo -n 'creating TLS CA db... '
if ! [ -e ca/tls-ca/db/tls-ca.db ]
then
  sh mk_tlsca_db.sh >> $LOG 2>&1
  check $?
else
  skip
fi

## create ca request
echo -n 'creating TLS CA certificate request... '
if ! [ -e ca/tls-ca.csr ]
then
  sh mk_tlsca_req.sh >> $LOG 2>&1
  check $?
else
  skip
fi

## create ca certificate
echo -n 'creating TLS CA certificate... '
if ! [ -e ca/tls-ca.crt ]
then
  sh mk_tlsca_cer.sh >> $LOG 2>&1
  check $?
else
  skip
fi

## create initial crl
echo -n 'initializing cert revoc list (CRL) for TLS CA... '
if ! [ -e crl/tls-ca.crl ]
then
  sh mk_tlsca_crl.sh >> $LOG 2>&1
  check $?
else
  skip
fi

## create pem bundle
echo -n 'creating PEM bundle for TLS CA... '
if [ -e ca/tls-ca.crt ]
then
  sh mk_tlsca_pem.sh >> $LOG 2>&1
  check $?
else
  skip
fi

#
# create software ca
#

## create directories
echo -n 'creating SoftwareCA dirs... '
if ! [ -d ca/software-ca ]
then
  sh mk_softca_dirs.sh >> $LOG 2>&1
  check $?
else
  skip
fi

## create database
echo -n 'creating SoftwareCA db... '
if ! [ -e ca/software-ca/db/software-ca.db ]
then
  sh mk_softca_db.sh >> $LOG 2>&1
  check $?
else
  skip
fi

## create ca request
echo -n 'creating TLS CA certificate request... '
if ! [ -e ca/software-ca.csr ]
then
  sh mk_softca_req.sh >> $LOG 2>&1
  check $?
else
  skip
fi

## create ca certificate
echo -n 'creating SoftwareCA certificate... '
if ! [ -e ca/software-ca.crt ]
then
  sh mk_softca_cer.sh >> $LOG 2>&1
  check $?
else
  skip
fi

## create initial crl
echo -n 'initializing cert revoc list (CRL) for SoftwareCA... '
if ! [ -e crl/software-ca.crl ]
then
  sh mk_softca_crl.sh >> $LOG 2>&1
  check $?
else
  skip
fi

## create pem bundle
echo -n 'creating PEM bundle for SoftwareCA... '
if [ -e ca/software-ca.crt ]
then
  sh mk_softca_pem.sh >> $LOG 2>&1
  check $?
else
  skip
fi

#
# operate email ca
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

## create pkcs#12 bundle
echo -n 'creating PKCS#12 bundle for email protection... '
if [ -e certs/fred.crt ]
then
  sh mk_email_p12.sh >> $LOG 2>&1
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
  sh mk_emailca_crl.sh >> $LOG 2>&1
  check $?
else
  skip
fi

# BAIL OUT
exit 1

#
# operate tls ca
#

## create tls server request

## create tls server certificate

## create pkcs#12 bundle (server)

## create tls client request

## create tls client certificate

## create pkcs#12 bundle (client)

## revoke certificate

## create crl

#
# operate software ca
#

## create code signing request

## create code signing certificate

## create pkcs#12 bundle

## revoke certificate

## create crl

#
# publish certificates
#

## create der certificate

## create der crl

## create pkcs#7 bundle



