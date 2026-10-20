repo-name=openshift-helm-charts
repo-url=https://charts.openshift.io/

chart-name=openshift-helm-charts/redhat-developer-hub
chart-version=1.3

release-name=redhat-developer-hub
release-namespace=rhdh-all-in-one-2042-test

cluster-route-suffix != ../../scripts/get-cluster-route-suffix.sh

install:
	helm repo add "${repo-name}" "${repo-url}"
	helm upgrade "${release-name}" "${chart-name}" \
	    --version "${chart-version}" \
		--install \
		--create-namespace \
		--namespace "${release-namespace}" \
		--set "global.clusterRouterBase=${cluster-route-suffix}" \
		--values ../../github.local.yaml \
		--values ../../kubernetes.local.yaml \
		--values ../../acr.local.yaml \
		--values values.yaml

uninstall:
	helm uninstall "${release-name}" --namespace "${release-namespace}" --keep-history

list:
	helm list --namespace "${release-namespace}"

status:
	helm status "${release-name}" --namespace "${release-namespace}" --show-resources

current-values:
	helm get values "${release-name}" --namespace "${release-namespace}"

default-values:
	helm show values "${chart-name}" --version "${chart-version}"

add-rbac-policies:
	oc create configmap rbac-policies --from-file "rbac-policies.csv"="rbac-policies.csv" --namespace "${release-namespace}"

add-rbac-conditional-policies:
	oc create configmap rbac-conditional-policies --from-file "rbac-conditional-policies.yaml"="rbac-conditional-policies.yaml" --namespace "${release-namespace}"
