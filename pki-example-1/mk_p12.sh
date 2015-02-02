#!/usr/bin/env ksh
#

cat email_pass.txt | ( cat export_pass.txt | echo "hello" ) 3<&0
