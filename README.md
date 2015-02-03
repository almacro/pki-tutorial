# pki-tutorial
This set of scripts automates CA exercises from the PKI tutorial found at:

  https://pki-tutorial.readthedocs.org/en/latest/

These scripts were developed on OpenBSD and presume the existence of Korn shell.
They should be easily converted to run on ba(sh) if needed.

The scripts depend on the etc directory given in the pki-tutorial.
Copy the scripts into the corresponding directory from the pki-tutorial.
Then change to a PKI directory (such as SimplePKI) and run

    sh run_all.sh

or run an individual script such as

    sh mk_rootca_db.sh

The scripts presume the existence of input files for SimplePKI:
  *  email_pass.txt
  *  p12_pass.txt
  *  rootca_pass.txt
  *  signca_pass.txt

Similarly, AdvancedPKI uses these input files:
  *  email_pass.txt
  *  emailca_pass.txt
  *  p12_pass.txt
  *  rootca_pass.txt
  *  signca_pass.txt
  *  softca_pass.txt
  *  tlsca_pass.txt

A secure - preferably automated - means of generating these files is a prerequisite to running the scripts.
