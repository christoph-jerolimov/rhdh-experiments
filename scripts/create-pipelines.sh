#!/bin/bash

namespace="christoph-backstage-test"

oc new-project "$namespace"

for i in $(seq 1 7); do
    oc create -n "$namespace" -f ../features/tekton/christoph-demo1-service-pipeline-run.yaml
done

for i in $(seq 1 7); do
    oc create -n "$namespace" -f ../features/tekton/christoph-demo2-service-pipeline-run.yaml
done

for i in $(seq 1 7); do
    oc create -n "$namespace" -f ../features/tekton/christoph-demo3-service-pipeline-run.yaml
done
