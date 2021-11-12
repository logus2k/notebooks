#!/bin/bash

# Create the private key and the certificate
pwd='Pa$$w0rd'
pfxFilePath='selfsigncert.pfx'
openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 -keyout privateKey.key -out selfsigncert.crt -subj /CN=localhost

# Convert the certificate to PEM format, which the curl tool can use
openssl pkcs12 -export -out $pfxFilePath -inkey privateKey.key -in selfsigncert.crt -password pass:$pwd
openssl pkcs12 -in selfsigncert.pfx -out selfsigncert.pem -nodes

# Get the thumbprint for the certificate
Fingerprint="$(openssl x509 -in selfsigncert.pem -noout -fingerprint)"
Fingerprint="${Fingerprint//:}"
echo ${Fingerprint#*=}

# Test an API without sending the certificate
curl -X GET https://apim-weatherdata01905389.azure-api.net/api/Weather/53/-1 -H 'Ocp-Apim-Subscri
ption-Key: 5cf1fe44b25d4b59ae9b359fbbad87f8'

# Test the API sending the certificate
curl -X GET https://apim-weatherdata01905389.azure-api.net/api/Weather/53/-1 -H 'Ocp-Apim-Subscription-Key: 5cf1fe44b25d4b59ae9b359fbbad87f8' --cert-type pem --cert selfsigncert.pem
