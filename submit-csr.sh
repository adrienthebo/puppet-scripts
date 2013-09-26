#!/bin/bash
#
# Submit a CSR to the CA
#
# usage: ./submit-csr.sh hostname serial

ca_server=$1
serial=$2

csr_file="csr-${serial}.pem"
cert_file="cert-${serial}.pem"

req_log="req-${serial}.txt"

cn="host${serial}"

baseurl="https://${ca_server}:8140/production"

echo -e "Submitting CSR for host ${cn}:" > $req_log
curl -s -k -X PUT -H 'Content-Type: text/plain' --data-binary "@${csr_file}" "${baseurl}/certificate_request/${cn}" >> $req_log
rv=$?
echo >> $req_log
echo "return value of curl: $rv" >> $req_log
