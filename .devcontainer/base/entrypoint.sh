#!/bin/bash

# delete if any cluster exists
kind delete cluster

# create a new cluster
kind create cluster --config /kind-cluster-config.yaml

# start kind cloud provider
docker run -d --rm --network host -v /var/run/docker.sock:/var/run/docker.sock \
  --name "cloud-provider-kind" quay.io/kubermatic-labs/devcontainers:cloud-provider-kind-v0.3.0

## deploy cilium
export CILIUM_VERSION="1.15.7"

docker pull quay.io/cilium/cilium:v${CILIUM_VERSION}
docker pull quay.io/cilium/operator-generic:v${CILIUM_VERSION}

kind load docker-image quay.io/cilium/cilium:v${CILIUM_VERSION}
kind load docker-image quay.io/cilium/operator-generic:v${CILIUM_VERSION}

helm install cilium cilium \
  --repo https://helm.cilium.io/ \
  --version ${CILIUM_VERSION} \
  --namespace kube-system \
  --set image.pullPolicy=IfNotPresent \
  --set ipam.mode=kubernetes
