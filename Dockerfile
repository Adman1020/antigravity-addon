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
    bash \
    gcompat \
    libc6-compat

# Install Antigravity CLI (Force glibc build despite being on Alpine/musl)
RUN curl -fsSL https://antigravity.google/cli/install.sh -o install.sh && \
    sed -i 's/platform="linux_${arch}_musl"/platform="linux_${arch}"/g' install.sh && \
    bash install.sh && \
    rm install.sh

COPY run.sh /
RUN sed -i 's/\r$//' /run.sh && chmod a+x /run.sh

CMD [ "/run.sh" ]
