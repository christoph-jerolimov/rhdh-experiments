repo-name=openshift-helm-charts
repo-url=https://charts.openshift.io/

chart-name=openshift-helm-charts/redhat-developer-hub
chart-version=1.8.0

release-name=redhat-developer-hub
release-namespace=rhdh-all-in-one-1-8-test

cluster-route-suffix != ../../scripts/get-cluster-route-suffix.sh

install:
	helm repo add "${repo-name}" "${repo-url}"
	helm upgrade "${release-name}" "${chart-name}" \
		--install \
		--create-namespace \
		--namespace "${release-namespace}" \
		--set "global.clusterRouterBase=${cluster-route-suffix}" \
		--values ../../github.local.yaml \
		--values ../../kubernetes.local.yaml \
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

update-default-values:
	helm repo update
	helm show values "${chart-name}" --version "${chart-version}" > default-values.yaml
