#!/bin/bash

namespace="default"
serviceaccount="rhdh-reader"

oc create -n "$namespace" serviceaccount "$serviceaccount"

# kubernetes core
oc create clusterrole rhdh-kubernetes-core-reader \
    --verb=get,watch,list \
    --resource=pods \
    --resource=pods/log \
    --resource=jobs \
    --resource=cronjobs \
    --resource=ingresses \
    --resource=statefulsets \
    --resource=configmaps \
    --resource=daemonsets \
    --resource=routes \
    --resource=limitranges \
    --resource=resourcequotas \
    --resource=deployments \
    --resource=replicasets \
    --resource=horizontalpodautoscalers \
    --resource=services

# kubernetes metrics
oc create clusterrole rhdh-kubernetes-metrics-reader \
   --verb=get,watch,list \
   --resource=pods.metrics.k8s.io

# openshift imagestreams
oc create clusterrole rhdh-openshift-imagestream-reader \
    --verb=get,watch,list \
    --resource=imagestreams.image.openshift.io \
    --resource=imagestreamtags.image.openshift.io

# tekton
oc create clusterrole rhdh-tekton-reader \
    --verb=get,watch,list \
    --resource=tasks.tekton.dev \
    --resource=taskruns.tekton.dev \
    --resource=pipelines.tekton.dev \
    --resource=pipelineruns.tekton.dev

# kubevirt
oc create clusterrole rhdh-kubevirt-reader \
    --verb=get,watch,list \
    --resource=virtualmachines.kubevirt.io

oc adm policy add-cluster-role-to-user rhdh-kubernetes-core-reader -n "$namespace" -z "$serviceaccount"
oc adm policy add-cluster-role-to-user rhdh-kubernetes-metrics-reader -n "$namespace" -z "$serviceaccount"
oc adm policy add-cluster-role-to-user rhdh-openshift-imagestream-reader -n "$namespace" -z "$serviceaccount"
oc adm policy add-cluster-role-to-user rhdh-tekton-reader -n "$namespace" -z "$serviceaccount"
oc adm policy add-cluster-role-to-user rhdh-kubevirt-reader -n "$namespace" -z "$serviceaccount"
