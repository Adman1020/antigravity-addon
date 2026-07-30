ARG BUILD_FROM="homeassistant/aarch64-base-debian:latest"
FROM $BUILD_FROM

# Install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3 \
    python3-pip \
    git \
    curl \
    xclip \
    tmux \
    && rm -rf /var/lib/apt/lists/*

# Download pre-compiled ttyd (since it's not in standard debian repos by default)
RUN curl -fsSL -o /usr/local/bin/ttyd https://github.com/tsl0922/ttyd/releases/download/1.7.7/ttyd.$(uname -m | sed -e 's/aarch64/aarch64/' -e 's/x86_64/x86_64/') && \
    chmod +x /usr/local/bin/ttyd

# Install Antigravity CLI
RUN curl -fsSL https://antigravity.google/cli/install.sh | bash

COPY run.sh /
RUN sed -i 's/\r$//' /run.sh && chmod a+x /run.sh

CMD [ "/run.sh" ]
