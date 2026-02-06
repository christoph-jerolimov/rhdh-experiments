#!/bin/bash

set -e

kubectl apply -f "$(dirname $0)/../operators/openshift-gitops.yaml"
kubectl apply -f "$(dirname $0)/../operators/openshift-pipelines.yaml"

# debug
# kubectl get -n openshift-gitops-operator clusterserviceversions.operators.coreos.com \
#     -l operators.coreos.com/openshift-gitops-operator.openshift-gitops-operator
# kubectl get -n openshift-operators clusterserviceversions.operators.coreos.com \
#     -l operators.coreos.com/openshift-pipelines-operator-rh.openshift-operators

kubectl wait --for=jsonpath='{.status.reason}'=InstallSucceeded \
    -n openshift-gitops-operator clusterserviceversions.operators.coreos.com \
    -l operators.coreos.com/openshift-gitops-operator.openshift-gitops-operator
kubectl wait --for=jsonpath='{.status.reason}'=InstallSucceeded \
    -n openshift-operators clusterserviceversions.operators.coreos.com \
    -l operators.coreos.com/openshift-pipelines-operator-rh.openshift-operators
