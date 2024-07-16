FROM docker:27.0.3-cli

ENV CLOUD_PROVIDER_KIND_VERSION=0.3.0

RUN apk add --no-cache wget && \
    wget https://github.com/kubernetes-sigs/cloud-provider-kind/releases/download/v${CLOUD_PROVIDER_KIND_VERSION}/cloud-provider-kind_${CLOUD_PROVIDER_KIND_VERSION}_linux_amd64.tar.gz && \
    tar zxvf cloud-provider-kind_${CLOUD_PROVIDER_KIND_VERSION}_linux_amd64.tar.gz cloud-provider-kind && mv cloud-provider-kind /usr/local/bin && \
    rm cloud-provider-kind_${CLOUD_PROVIDER_KIND_VERSION}_linux_amd64.tar.gz

CMD ["/usr/local/bin/cloud-provider-kind"]
