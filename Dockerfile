ARG BUILD_FROM="homeassistant/aarch64-base:latest"
FROM $BUILD_FROM

# Install dependencies
RUN apk add --no-cache \
    python3 \
    py3-pip \
    nodejs \
    npm \
    git \
    curl \
    ttyd \
    bash

# Install Antigravity CLI
RUN curl -fsSL https://antigravity.google/cli/install.sh | bash

COPY run.sh /
RUN sed -i 's/\r$//' /run.sh && chmod a+x /run.sh

CMD [ "/run.sh" ]
