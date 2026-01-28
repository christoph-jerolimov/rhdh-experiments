# https://quay.io/repository/rhdh/chart?tab=tags
# https://quay.io/repository/rhdh/rhdh-hub-rhel9?tab=tags
chart-name=oci://quay.io/rhdh/chart
chart-version=1.8-160-CI

release-name=redhat-developer-hub
release-namespace=rhdh-pr-3791-test

cluster-route-suffix != ../../scripts/get-cluster-route-suffix.sh

install:
	helm upgrade "${release-name}" "${chart-name}" --version "${chart-version}" \
		--install \
		--create-namespace \
		--namespace "${release-namespace}" \
		--set "global.clusterRouterBase=${cluster-route-suffix}" \
		--values ../../github.local.yaml \
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
