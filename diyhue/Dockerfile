FROM ghcr.io/hassio-addons/base-python:17.0.0

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Set the build architecture and convert it from hassio to diyhue style
# armhf, armv7, aarch64, amd64, i386
ARG BUILD_ARCH=aarch64
ENV BUILD_ARCHI=${BUILD_ARCH}

# Other settings
ENV LANG=C.UTF-8
ENV DIYHUE_VERSION=master
ENV DIYHUE_COMMIT=ebd0eaf493e1054515a5d996bcb3fea36a154c0f
ENV DIYHUE_UI_VERSION=v2.0.3
ENV WORKING_DIR=/opt/hue-emulator

# Create the needed folders
RUN mkdir diyhue config ${WORKING_DIR}

# 17.0.0 pins musl=1.2.5-r10 and libcrypto3/libssl3=3.5.1 in /etc/apk/world.
# Upgrade those first so musl-dev and the openssl CLI can install from current Alpine.
# Do not apk add python3 — already in the image.
RUN apk add --no-cache --upgrade musl musl-utils libcrypto3 libssl3 \
    && apk add --no-cache \
        gcc make musl-dev wget openssl \
        nmap psmisc iproute2 curl unzip bluez libfaketime

# Download diyhue and unzip it
RUN curl -sL -o diyhue.zip https://github.com/diyhue/diyHue/archive/${DIYHUE_COMMIT}.zip
RUN unzip -qo diyhue.zip
RUN rm diyhue.zip
RUN pip3 install -r /diyHue-${DIYHUE_COMMIT}/requirements.txt --no-cache-dir --break-system-packages --ignore-installed

# Install diyHue
RUN cp -r /diyHue-${DIYHUE_COMMIT}/BridgeEmulator/flaskUI /opt/hue-emulator/
RUN cp -r /diyHue-${DIYHUE_COMMIT}/BridgeEmulator/functions /opt/hue-emulator/
RUN cp -r /diyHue-${DIYHUE_COMMIT}/BridgeEmulator/lights /opt/hue-emulator/
RUN cp -r /diyHue-${DIYHUE_COMMIT}/BridgeEmulator/sensors /opt/hue-emulator/
RUN cp -r /diyHue-${DIYHUE_COMMIT}/BridgeEmulator/HueObjects /opt/hue-emulator/
RUN cp -r /diyHue-${DIYHUE_COMMIT}/BridgeEmulator/services /opt/hue-emulator/
RUN cp -r /diyHue-${DIYHUE_COMMIT}/BridgeEmulator/configManager /opt/hue-emulator/
RUN cp -r /diyHue-${DIYHUE_COMMIT}/BridgeEmulator/logManager /opt/hue-emulator/
RUN cp -r /diyHue-${DIYHUE_COMMIT}/BridgeEmulator/HueEmulator3.py /opt/hue-emulator/
RUN cp -r /diyHue-${DIYHUE_COMMIT}/BridgeEmulator/githubInstall.sh /opt/hue-emulator/
RUN cp -r /diyHue-${DIYHUE_COMMIT}/BridgeEmulator/genCert.sh /diyHue-${DIYHUE_COMMIT}/BridgeEmulator/openssl.conf	/opt/hue-emulator/


RUN curl -sL -o diyHueUI.zip https://github.com/diyhue/diyHueUI/releases/download/${DIYHUE_UI_VERSION}/DiyHueUI-release.zip
RUN mkdir /diyhueUI
RUN unzip -qo diyHueUI.zip -d /diyhueUI
RUN rm diyHueUI.zip
RUN cp -r /diyhueUI/dist/index.html			/opt/hue-emulator/flaskUI/templates/
RUN cp -r /diyhueUI/dist/assets			/opt/hue-emulator/flaskUI/
RUN rm -r /diyhueUI
RUN rm -r /diyHue-${DIYHUE_COMMIT}

# Set working directory to the Archive folder
WORKDIR /opt/hue-emulator

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
	io.hass.description="Fully configurable diyHue Emulator" \
	io.hass.arch="${BUILD_ARCH}" \
	io.hass.type="addon" \
	io.hass.version=${BUILD_VERSION} \
	maintainer="diyHue <info@diyHue.org>" \
	org.opencontainers.image.title="diyHue" \
	org.opencontainers.image.description="Fully configurable diyHue Emulator" \
	org.opencontainers.image.vendor="diyHue" \
	org.opencontainers.image.authors="diyHue <info@diyHue.org>" \
	org.opencontainers.image.licenses="MIT" \
	org.opencontainers.image.url="diyHue.org" \
	org.opencontainers.image.source="https://github.com/diyhue/diyhue" \
	org.opencontainers.image.documentation="diyhue.readthedocs.io" \
	org.opencontainers.image.created=${BUILD_DATE} \
	org.opencontainers.image.revision=${BUILD_REF} \
	org.opencontainers.image.version=${BUILD_VERSION}

CMD [ "./run.sh" ]
