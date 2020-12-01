ARG BUILD_FROM=hassioaddons/base-python:5.3.4
# hadolint ignore=DL3006
FROM ${BUILD_FROM}

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Set the build architecture and convert it from hassio to diyhue style
# armhf, armv7, aarch64, amd64, i386
ARG BUILD_ARCH=aarch64

# Other settings
ENV LANG C.UTF-8
ENV DIYHUE_VERSION=master
ENV ARCHIVE=diyhue

# Download diyHue and extract
RUN apk add --update --no-cache curl jq nodejs npm socat python2 make gcc g++ linux-headers udev git python2 \
	&& mkdir $ARCHIVE \
	&& mkdir config \
	&& curl -J -L -o $ARCHIVE.tar.gz "https://github.com/diyhue/diyHue/archive/2.1.tar.gz" \
	&& tar xzvf $ARCHIVE.tar.gz --strip-components=1 -C $ARCHIVE \
	&& rm -rf $ARCHIVE.tar.gz

# Set working directory to the Archive folder
WORKDIR ${ARCHIVE}

COPY rootfs run.sh ./

RUN chmod +x ./select.sh \
	&& chmod a+x ./run.sh \
    	&& mkdir ./out \
    	&& ./select.sh

RUN apk add --update --no-cache openssl nmap psmisc iproute2 \
    && pip3 install --no-cache-dir -r requirements.txt \
    && mv src/core/* .

RUN echo $(ls)

# Build arguments
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION

## Document volume
VOLUME ["/config"]

# Labels
LABEL \
    io.hass.name="DiyHue" \
    io.hass.description="Fully configurable diyHue hue emulator" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="Max Beckenbauer <max.bec92@gmail.com>" \
    org.opencontainers.image.title="diyHue" \
    org.opencontainers.image.description="Fully configurable diyHue hue emulator" \
    org.opencontainers.image.vendor="Max Beckenbauer" \
    org.opencontainers.image.authors="Max Beckenbauer <max.bec92@gmail.com>" \
    org.opencontainers.image.licenses="MIT" \
    org.opencontainers.image.url="" \
    org.opencontainers.image.source="" \
    org.opencontainers.image.documentation="" \
    org.opencontainers.image.created=${BUILD_DATE} \
    org.opencontainers.image.revision=${BUILD_REF} \
    org.opencontainers.image.version=${BUILD_VERSION}

CMD [ "./run.sh" ]
