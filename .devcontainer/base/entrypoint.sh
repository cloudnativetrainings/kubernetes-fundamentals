#!/bin/bash

# delete if any cluster exists
kind delete cluster

# create a new cluster
kind create cluster --config /kind-cluster-config.yaml

# start kind cloud provider
docker run -d --rm --network host -v /var/run/docker.sock:/var/run/docker.sock \
  --name "cloud-provider-kind" quay.io/kubermatic-labs/devcontainers:cloud-provider-kind-adb535d

# deploy cilium
# CILIUM_VERSION is defined in .devcontainer.json file

kind load docker-image quay.io/cilium/cilium:v${CILIUM_VERSION}
kind load docker-image quay.io/cilium/operator-generic:v${CILIUM_VERSION}

helm install cilium cilium \
  --repo https://helm.cilium.io/ \
  --version ${CILIUM_VERSION} \
  --namespace kube-system \
  --set image.pullPolicy=IfNotPresent \
  --set ipam.mode=kubernetes
