# Some personal [RHDH](https://developers.redhat.com/rhdh) experiments 🧪

## How to use it

1. Clone repo or pick up a folder as an example for your own helm chart

2. Required cli tools: `helm`, `oc` and `yq`

3. `oc` cli must connected to to an OpenShift cluster

   (with read access to `ConfigMap` `cluster-config-v1` in `kube-system` namespace)

4. Copy `github.sample.yaml` to `github.local.yaml` and change the content to enable GitHub authentification.

5. All helm charts automatically create a new namespace by default!

   You should be able to customize the `Makefile` or helm charts before applying them.

6. Use `make` instead of `helm install`

   It automatically applies

   * the correct `global.clusterRouterBase` from the connected cluster,
   * the `github.local.yaml` and
   * depennding on the example other configurations from `values.yaml`

Example:

```
cd all-in-one/next
make
```

## Links

* For some Backstage experiments see https://github.com/christoph-jerolimov/backstage-experiments
