#!/bin/bash
#
# Generate an x509 private key and CSR
#
# usage: ./get-cert.sh serial

serial=$1

privkey="key-${serial}.pem"
csr_file="csr-${serial}.pem"

cn="host${serial}"

openssl genrsa -out $privkey 1024
openssl req -new -key $privkey -subj "/CN=${cn}" -out $csr_file
