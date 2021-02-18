FROM hashicorp/packer:light

# Install Ansible for provisioning



RUN apk add --no-cache --purge -uU ansible ansible-lint sudo curl ca-certificates openssh-client \
  && apk --update add --virtual .build-dependencies python3-dev libffi-dev openssl-dev build-base \
  && pip install --no-cache --upgrade ansible \
  && apk del --purge .build-dependencies \
  && rm -rf /var/cache/apk/*



COPY "entrypoint.sh" "/entrypoint.sh"

ENTRYPOINT ["/entrypoint.sh"]
