#!/bin/bash
#
# Retrieve a signed certificate from a puppet master
#
# usage: ./get-cert.sh hostname serial

ca_server=$1
serial=$2

cert_file="cert-${serial}.pem"

cn="host${serial}"

baseurl="https://${ca_server}:8140/production"

curl -s -k -H 'Accept: s' "${baseurl}/certificate/${cn}" > $cert_file
