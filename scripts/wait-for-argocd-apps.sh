#!/bin/bash

set -e

kubectl get -n openshift-gitops applications.argoproj.io

# wait for sync
echo
echo Wait that Argo CD sync status reports synced
echo
kubectl wait --for=jsonpath='{.status.sync.status}'=Synced -n openshift-gitops applications.argoproj.io --all

# wait for health status
echo
echo Wait that Argo CD health status reports healthy
echo
kubectl wait --for=jsonpath='{.status.health.status}'=Synced -n openshift-gitops applications.argoproj.io --all
