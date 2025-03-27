#!/bin/sh

# Inputs
CRT=${CRT:-/certs/tls.crt}
KEY=${KEY:-/certs/tls.key}
CA=${CA:-/certs/ca.crt}
OUT=${OUT:-/output/certificate.pfx}
PASSWORD=${PASSWORD:-changeit}

# Make sure all necessary files exist
if [[ ! -f "$CRT" ]]; then echo "Missing certificate: $CRT"; exit 1; fi
if [[ ! -f "$KEY" ]]; then echo "Missing private key: $KEY"; exit 1; fi
if [[ ! -f "$CA" ]]; then echo "Missing CA certificate: $CA"; exit 1; fi

# Ensure output directory exists
mkdir -p "$(dirname "$OUT")"

# Convert to PFX
openssl pkcs12 -export \
  -in "$CRT" \
  -inkey "$KEY" \
  -certfile "$CA" \
  -out "$OUT" \
  -password "pass:$PASSWORD" \
  -passin "pass:$PASSWORD" \
  -passout "pass:$PASSWORD"

chmod 644 "$OUT"