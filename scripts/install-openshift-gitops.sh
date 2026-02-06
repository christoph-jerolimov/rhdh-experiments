#!/bin/bash

set -e

kubectl apply -f "$(dirname $0)/../operators/openshift-gitops.yaml"

# debug
# kubectl get -n openshift-gitops-operator clusterserviceversions.operators.coreos.com \
#     -l operators.coreos.com/openshift-gitops-operator.openshift-gitops-operator

kubectl wait --for=jsonpath='{.status.reason}'=InstallSucceeded \
    -n openshift-gitops-operator clusterserviceversions.operators.coreos.com \
    -l operators.coreos.com/openshift-gitops-operator.openshift-gitops-operator
