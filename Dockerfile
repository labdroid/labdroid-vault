FROM registry.access.redhat.com/ubi9

MAINTAINER anthony@atgreen.org

RUN yum install -y unzip && yum clean all -y

RUN curl https://releases.hashicorp.com/vault/1.15.4/vault_1.15.4_linux_amd64.zip > vault.zip \
    && unzip vault.zip && chmod +x vault && rm vault.zip

RUN mkdir /opt/vault
RUN chown -R 1001:1001 /opt/vault

USER 1001

EXPOSE 8200

CMD ["./vault", "server", "--config=/etc/vault.hcl"]
