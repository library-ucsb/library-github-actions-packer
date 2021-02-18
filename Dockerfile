FROM hashicorp/packer:light

# Install Ansible for provisioning
RUN apk add --no-cache python3 ansible 

COPY "entrypoint.sh" "/entrypoint.sh"

ENTRYPOINT ["/entrypoint.sh"]
