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
echo -n 'creating NetworkCA certificate request... '
if ! [ -e ca/network-ca.csr ]
then
  sh mk_netca_req.sh >> $LOG 2>&1
  check $?
else
  skip
fi

## create ca certificate
echo -n 'creating NetworkCA certificate... '
if ! [ -e ca/network-ca.crt ]
then
  sh mk_netca_cer.sh >> $LOG 2>&1
  check $?
else
  skip
fi

## create initial crl
echo -n 'initializing cert revoc list (CRL) for NetworkCA... '
if ! [ -e crl/network-ca.crl ]
then
  sh mk_netca_crl.sh >> $LOG 2>&1
  check $?
else
  skip
fi

## create pem bundle
echo -n 'creating PEM bundle for NetworkCA... '
if [ -e ca/network-ca.crt ]
then
  sh mk_netca_pem.sh >> $LOG 2>&1
  check $?
else
  skip
fi

#
# create identity ca
#

## create directories
echo -n 'creating IdentityCA dirs... '
if ! [ -d ca/identity-ca ]
then
  sh mk_idenca_dirs.sh >> $LOG 2>&1
  check $?
else
  skip
fi

## create database
echo -n 'creating IdentityCA db... '
if ! [ -e ca/identity-ca/db/identity-ca.db ]
then
  sh mk_idenca_db.sh >> $LOG 2>&1
  check $?
else
  skip
fi

## create ca request
echo -n 'creating IdentityCA certificate request... '
if ! [ -e ca/identity-ca.csr ]
then
  sh mk_idenca_req.sh >> $LOG 2>&1 
  check $?
else
  skip
fi

## create ca certificate
echo -n 'creating IdentityCA certificate... '
if ! [ -e ca/identity-ca.crt ]
then
  sh mk_idenca_cer.sh >> $LOG 2>&1
  check $?
else
  skip
fi

## create initial crl
echo -n 'initializing cert revoc list (CRL) for IdentityCA... '
if ! [ -e crl/identity-ca.crl ]
then
  sh mk_idenca_crl.sh >> $LOG 2>&1
  check $?
else
  skip
fi

## create pem bundle
echo -n 'creating PEM bundle for IdentityCA... '
if [ -e ca/identity-ca.crt ]
then
  sh mk_idenca_pem.sh >> $LOG 2>&1
  check $?
else
  skip
fi

#
# create component ca
#

## create directories
echo -n 'creating ComponentCA dirs... '
if ! [ -d ca/component-ca ]
then
  sh mk_compca_dirs.sh >> $LOG 2>&1
  check $?
else
  skip
fi

## create database
echo -n 'creating ComponentCA db... '
if ! [ -e ca/component-ca/db/component-ca.db ]
then
  sh mk_compca_db.sh >> $LOG 2>&1
  check $?
else
  skip
fi

## create ca request
echo -n 'creating ComponentCA certificate request... '
if ! [ -e ca/component-ca.csr ]
then
  sh mk_compca_req.sh >> $LOG 2>&1  
  check $?
else
  skip
fi

## create ca certificate
echo -n 'creating ComponentCA certificate... '
if ! [ -e ca/component-ca.crt ]
then
  sh mk_compca_cer.sh >> $LOG 2>&1  
  check $?
else
  skip
fi

## create initial crl
echo -n 'initializing cert revoc list (CRL) for ComponentCA... '
if ! [ -e crl/component-ca.crl ]
then
  sh mk_compca_crl.sh >> $LOG 2>&1
  check $?
else
  skip
fi

## create pem bundle
echo -n 'creating PEM bundle for ComponentCA... '
if [ -e ca/component-ca.crt ]
then
  sh mk_compca_pem.sh >> $LOG 2>&1
  check $?
else
  skip
fi

#
# operate identity ca
#

## create identity request
echo -n 'creating identity certificate request... '
if ! [ -e certs/fred-id.csr ]
then
  sh mk_iden_req.sh >> $LOG 2>&1
  check $?
else
  skip
fi

## create identity certificate
echo -n 'creating identity certificate... '
if ! [ -e certs/fred-id.crt ]
then
  sh mk_iden_cer.sh >> $LOG 2>&1
  check $?
else
  skip
fi

## create pkcs#12 bundle
echo -n 'creating PKCS#12 bundle for identity... '
if [ -e certs/fred-id.crt ]  
then
  sh mk_iden_p12.sh >> $LOG 2>&1
  check $?
else
  skip
fi

## create encryption request
echo -n 'creating encryption certificate request... '
if ! [ -e certs/fred-enc.csr ]
then
  sh mk_enc_req.sh >> $LOG 2>&1
  check $?
else
  skip
fi
  
## create encryption certificate
echo -n 'creating encryption certificate... '
if ! [ -e certs/fred-enc.crt ]
then
  sh mk_enc_cer.sh >> $LOG 2>&1
  check $?
else
  skip
fi

## create pkcs#12 bundle
echo -n 'creating PKCS#12 bundle for encryption... '
if [ -e certs/fred-enc.crt ]
then  
  sh mk_enc_p12.sh >> $LOG 2>&1
  check $?
else
  skip
fi
  
## revoke certificate
echo -n 'revoking identity certificate with serial#=0x02... '
sh ck_iden_revoc.sh > /dev/null
if [ $? -eq 0 ]
then
  sh rev_02_iden_cer.sh >> $LOG 2>&1
  check $?
else
  skip
fi

## create crl
echo -n 'creating cert revoc list (CRL) for identity certificate... '
sh ck_iden_revoc.sh > /dev/null
if [ $? -eq 0 ]
then
  sh mk_iden_crl.sh >> $LOG 2>&1
  check $?
else
  skip
fi  

#
# operate component ca
#

## create tls server request
echo -n 'creating TLS server certificate request... '
if ! [ -e certs/blue.se.csr ]
then
  sh mk_tlserv_req.sh >> $LOG 2>&1
  check $?
else
  skip
fi

## create tls server certificate
echo -n 'creating TLS server certificate... '
if ! [ -e certs/blue.se.crt ]
then
  sh mk_tlserv_cer.sh >> $LOG 2>&1
  check $?
else
  skip
fi

## create tls client request
echo -n 'creating TLS client certificate request... '
if ! [ -e certs/net-mon.csr ]
then
  sh mk_tlscli_req.sh >> $LOG 2>&1
  check $?
else
  skip
fi

## create tls client certificate
echo -n 'creating TLS client certificate... '
if ! [ -e certs/net-mon.crt ]
then
  sh mk_tlscli_cer.sh >> $LOG 2>&1
  check $?
else
  skip
fi

## create time-stamping request
echo -n 'creating time-stamping certificate request... '
if ! [ -e certs/tsa.csr ]
then
  sh mk_tsa_req.sh >> $LOG 2>&1
  check $?
else  
  skip
fi

## create time-stamping certificate
echo -n 'creating time-stamping certificate... '
if ! [ -e certs/tsa.crt ]
then
  sh mk_tsa_cer.sh >> $LOG 2>&1
  check $?
else
  skip
fi

## create ocsp-signing request
echo -n 'creating ocsp-signing certificate request... '
if ! [ -e certs/ocsp.csr ]
then
  sh mk_ocsp_req.sh >> $LOG 2>&1
  check $?
else
  skip
fi

## create ocsp-signing certificate
echo -n 'creating ocsp-signing certificate... '
if ! [ -e certs/ocsp.crt ]
then
  sh mk_ocsp_cer.sh >> $LOG 2>&1
  check $?
else
  skip
fi

## revoke certificate
echo -n 'revoking component certificate with serial#=0x02... '
sh ck_comp_revoc.sh > /dev/null
if [ $? -eq 0 ]
then
  sh rev_02_comp_cer.sh >> $LOG 2>&1
  check $?
else  
  skip
fi

## create crl
echo -n 'creating cert revoc list (CRL) for component certificate... '
sh ck_comp_revoc.sh > /dev/null
if [ $? -eq 0 ]
then
  sh mk_comp_crl.sh >> $LOG 2>&1  
  check $?
else
  skip
fi

# BAIL OUT
exit 1

#
# publish certificates
#

## create der certificate

## create der crl

## create pkcs#7 bundle

