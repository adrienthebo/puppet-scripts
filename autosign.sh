#!/bin/bash
#
# Submit a CSR to the CA and retrieve the signed cert
#
# usage: ./autosign.sh hostname serial

basedir=$(dirname $0)

echo "Submitting CSR with serial ${2} to ${1}"
$basedir/submit-csr.sh $1 $2
echo "Submitted CSR ${2}"

sleep 1

echo "Retrieving certificate for serial ${2} from ${1}"
$basedir/get-cert.sh $1 $2
