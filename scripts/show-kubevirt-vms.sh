#!/bin/bash

namespace="default"
serviceaccount="rhdh-reader"

token=$(oc create -n "$namespace" token --duration=168h "$serviceaccount")
whoami=$(oc "--token=$token" whoami)

echo
echo "whoami: $whoami"
echo

oc "--token=$token" get --all-namespaces virtualmachines.kubevirt.io
