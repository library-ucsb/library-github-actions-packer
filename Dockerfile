FROM hashicorp/packer:light

# Install Ansible for provisioning
RUN apk add --no-cache --virtual .run-deps \
       python2 \
       openssh \
    && apk add --no-cache --virtual .build-deps \
        alpine-sdk \
        py-setuptools \
        libffi-dev \
        python2-dev \
        openssl-dev \
    && easy_install-2.7 pip \
    && pip install ansible \
    && apk --purge del .build-deps \
    && rm -rf /var/cache/apk /root/.cache


COPY "entrypoint.sh" "/entrypoint.sh"

ENTRYPOINT ["/entrypoint.sh"]
