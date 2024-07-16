# This image is built manually and pushed to korayoksay/devcontainers:base-v0.0.2
FROM mcr.microsoft.com/vscode/devcontainers/base:ubuntu-22.04

ENV KIND_VERSION=v0.23.0
ENV K8S_VERSION=v1.30.2
ENV HELM_VERSION=v3.15.2

RUN apt-get update && apt-get -y --no-install-recommends install fzf bash-completion bat vim && rm -rf /var/lib/apt/lists/* && \
    curl -L https://kind.sigs.k8s.io/dl/${KIND_VERSION}/kind-linux-amd64 -o /usr/local/bin/kind && chmod +x /usr/local/bin/kind && \
    curl -L https://storage.googleapis.com/kubernetes-release/release/${K8S_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl && chmod +x /usr/local/bin/kubectl && \
    curl -L https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz | tar xz && mv linux-amd64/helm /usr/local/bin/helm && rm -rf linux-amd64 && \
    curl -L https://rawgit.com/kubermatic/fubectl/master/fubectl.source -o /root/fubectl.source && \
    echo "[ -f /root/fubectl.source ] && source /root/fubectl.source" >> /root/.bashrc && echo 'source /etc/bash_completion' >> /root/.bashrc && \
    echo 'source <(kubectl completion bash)' >> /root/.bashrc && echo 'alias cat=batcat' >> /root/.bashrc && echo '-w "\\n"' > /root/.curlrc


COPY --chmod=755 entrypoint.sh /entrypoint.sh
COPY kind-cluster-config.yaml /kind-cluster-config.yaml

ENTRYPOINT ["/entrypoint.sh"]

