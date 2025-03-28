ARG ALPINE_VERSION=3.21.3
FROM alpine:${ALPINE_VERSION}

# Install openssl and bash for better scripting
ARG OPENSSL_VERSION=3.3.3-r0
RUN apk add --no-cache openssl=${OPENSSL_VERSION} bash

# Set working directory
WORKDIR /app

# Copy the conversion script
COPY convert.sh /app/convert.sh
RUN chmod +x /app/convert.sh

ENTRYPOINT ["/app/convert.sh"]