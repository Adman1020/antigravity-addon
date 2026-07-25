ARG BUILD_FROM
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

# Install Antigravity CLI (assuming it's installed via pip or npm depending on the actual package)
# Note: As of right now, Antigravity is a mock package for the vibe coded add-on. 
# We'll put a placeholder script for `agy` if the real pip package isn't publicly available yet, 
# or install it using npm/pip if it is. 
# For this project, we'll ensure `agy` is available in the path.

COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
