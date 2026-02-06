#!/bin/bash

set -e

echo
echo Install and wait for operators...
echo
"$(dirname $0)/scripts/install-openshift-operators.sh"

echo
echo Apply Argo CD app-of-apps
echo
kubectl apply -n openshift-gitops -f "$(dirname $0)/argocd/app-of-apps.yaml"
kubectl wait --for=jsonpath='{.status.sync.status}'=Synced -n openshift-gitops applications.argoproj.io rhdh-app-of-apps
