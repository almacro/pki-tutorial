# pki-tutorial
This set of scripts automates CA exercises from the PKI tutorial found at:
https://pki-tutorial.readthedocs.org/en/latest/

These scripts were developed on OpenBSD and presume the existence of Korn shell.
They should be easily converted to run on ba(sh) if needed.

The scripts presume the existence of input files:
  email_pass.txt
  p12_pass.txt
  rootca_pass.txt
  signca_pass.tx

A secure - preferably automated - means of generating these files is a prerequisite to running the scripts.
