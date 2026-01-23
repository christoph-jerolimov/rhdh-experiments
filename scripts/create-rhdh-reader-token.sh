#!/bin/bash

namespace="default"
serviceaccount="rhdh-reader"

oc create -n "$namespace" token --duration=168h "$serviceaccount"
