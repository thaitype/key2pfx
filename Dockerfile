FROM alpine:3.21.3

# Install openssl and bash for better scripting
RUN apk add --no-cache openssl bash

# Set working directory
WORKDIR /app

# Copy the conversion script
COPY convert.sh /app/convert.sh
RUN chmod +x /app/convert.sh

ENTRYPOINT ["/app/convert.sh"]