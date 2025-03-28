#!/bin/sh

NAMESPACE=${NAMESPACE:-default}

kubectl create -n $NAMESPACE secret generic key-cert --from-file=tls.crt=tls.crt --from-file=tls.key=tls.key --from-file=ca.crt=ca.crt