# Source image
FROM  node:${NODE_VERSION}

# Update package cache
RUN  apt-get update

# Install krb5 and gssapi_krb5
RUN  apt-get install libkrb5-dev

# Increate system ulimit
COPY  ./limits.conf /etc/security/limits.conf

# Copy start-up script
COPY  ./start.sh /start.sh

# Set working directory
WORKDIR  /var/app

# Start the container
ENTRYPOINT  ["/start.sh"]