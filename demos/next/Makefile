release-name=redhat-developer-hub
release-namespace=rhdh-all-in-one-next-test

install:
	helm upgrade --install "${release-name}" . \
		--create-namespace \
		--namespace "${release-namespace}" \
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

update-dependencies:
	helm dependency update

update-default-values:
	helm show values charts/chart-*.tgz > default-values.yaml

# Dump dynamic-plugins.default.yaml from the catalog index image
update-dynamic-plugins-default:
	@registry=$$(yq -r '.catalogIndex.image.registry' default-values.yaml); \
	repository=$$(yq -r '.catalogIndex.image.repository' default-values.yaml); \
	digest=$$(yq -r '.catalogIndex.image.digest' default-values.yaml); \
	tag=$$(yq -r '.catalogIndex.image.tag' default-values.yaml); \
	if [ -n "$$digest" ]; then image="$${registry}/$${repository}@$${digest}"; \
	else image="$${registry}/$${repository}:$${tag}"; fi; \
	echo "Use $$image"; \
	echo "from default-values.yaml to update dynamic-plugins.default.yaml"; \
	cid=$$(podman create "$$image" 2>/dev/null); \
	podman cp "$$cid:/dynamic-plugins.default.yaml" ./dynamic-plugins.default.yaml; \
	podman rm "$$cid" >/dev/null

update: update-dependencies update-default-values update-dynamic-plugins-default
