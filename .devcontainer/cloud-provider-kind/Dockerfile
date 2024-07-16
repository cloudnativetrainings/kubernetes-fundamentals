FROM docker:27.0.3-cli

RUN apk add --no-cache wget && \
    wget https://github.com/kubernetes-sigs/cloud-provider-kind/releases/download/v0.3.0/cloud-provider-kind_0.3.0_linux_amd64.tar.gz && \
    tar zxvf cloud-provider-kind_0.3.0_linux_amd64.tar.gz cloud-provider-kind && mv cloud-provider-kind /usr/local/bin && \
    rm cloud-provider-kind_0.3.0_linux_amd64.tar.gz

CMD ["/usr/local/bin/cloud-provider-kind"]
