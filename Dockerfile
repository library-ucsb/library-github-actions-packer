FROM hashicorp/packer:light

# Install Ansible for provisioning
RUN apk update \
 && apk add --no-cache python3 musl-dev libffi-dev openssl-dev make gcc python py2-pip python-dev \
 && pip install cffi \
 && pip install ansible

COPY "entrypoint.sh" "/entrypoint.sh"

ENTRYPOINT ["/entrypoint.sh"]
