ARG BUILD_FROM=hassioaddons/base-python:5.3.4
# hadolint ignore=DL3006
FROM ${BUILD_FROM}

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Set the build architecture and convert it from hassio to diyhue style
# armhf, armv7, aarch64, amd64, i386
ARG BUILD_ARCH=aarch64
ENV BUILD_ARCHI = ${BUILD_ARCH}

# Other settings
ENV LANG C.UTF-8
ENV DIYHUE_VERSION=master
ENV WORKING_DIR=/opt/hue-emulator

# Create the needed folders
RUN mkdir diyhue config ${WORKING_DIR}

# Install all needed dependencies
RUN apk add -q -u python3 openssl nmap psmisc iproute2 alpine-sdk build-base

# Download diyhue and untar it
RUN curl -J -L -o $diyhue.tar.gz "https://github.com/diyhue/diyHue/archive/refs/heads/flask.tar.gz" \
	&& tar xzvf $diyhue.tar.gz --strip-components=1 -C diyhue \
	&& rm -rf $diyhue.tar.gz \
	&& pip3 install -r /diyhue/requirements.txt --no-cache-dir

# Set working directory to the Archive folder
WORKDIR /opt/hue-emulator

# Install diyHue
RUN mv /diyhue/BridgeEmulator/web-ui/ 											./web-ui/
RUN mv /diyhue/BridgeEmulator/functions/ 										./functions/
RUN mv /diyhue/BridgeEmulator/protocols/ 										./protocols/
RUN mv /diyhue/BridgeEmulator/HueEmulator3.py /diyhue/BridgeEmulator/debug/clip.html 	./
RUN mv /diyhue/BridgeEmulator/genCert.sh /diyhue/BridgeEmulator/openssl.conf 			./

# Copy additional local build files
COPY rootfs ./

# Modify user rights of additional files
RUN chmod +x ./select.sh ./genCert.sh && chmod a+x ./run.sh

# Sleect the right binaries depending on the arch
RUN ./select.sh

# Build arguments
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION

## Document volume
VOLUME ["/config"]

# Labels
LABEL \
	io.hass.name="diyHue" \
	io.hass.description="Fully configurable Philips Hue emulator" \
	io.hass.arch="${BUILD_ARCH}" \
	io.hass.type="addon" \
	io.hass.version=${BUILD_VERSION} \
	maintainer="Max Beckenbauer <max.bec92@gmail.com>" \
	org.opencontainers.image.title="diyHue" \
	org.opencontainers.image.description="Fully configurable Philips Hue emulator" \
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
