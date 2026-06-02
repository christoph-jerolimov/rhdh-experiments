#!/bin/bash

dirname=$(dirname $0)

namespace="christoph"

oc new-project "$namespace"

for i in $(seq 1 3); do
    oc create -n "$namespace" -f "$dirname/../features/tekton/christoph-demo1-service-pipeline-run.yaml"
done

for i in $(seq 1 5); do
    oc create -n "$namespace" -f "$dirname/../features/tekton/christoph-demo2-service-pipeline-run.yaml"
done

for i in $(seq 1 23); do
    oc create -n "$namespace" -f "$dirname/../features/tekton/christoph-demo3-service-pipeline-run.yaml"
done
