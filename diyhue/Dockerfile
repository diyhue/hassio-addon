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
RUN apk add --no-cache bluez

# Download diyhue and untar it
#RUN curl -J -L -o diyhue.tar.gz "https://github.com/diyhue/diyHue/archive/refs/heads/master.tar.gz"
#RUN curl -J -L -o diyhue.tar.gz  "https://github.com/hendriksen-mark/diyHue/archive/refs/heads/master.tar.gz"
RUN curl -sL -o diyhue.zip https://github.com/hendriksen-mark/diyhue/archive/refs/heads/master.zip
#RUN tar xzf diyhue.tar.gz --strip-components=1 -C diyhue 
#RUN rm -rf diyhue.tar.gz 
RUN unzip -qo diyhue.zip
RUN pip3 install -r /diyhue-master/requirements.txt --no-cache-dir

# Install diyHue
RUN cp -r /diyhue-master/BridgeEmulator/flaskUI/ /opt/hue-emulator/flaskUI/
RUN cp -r /diyhue-master/BridgeEmulator/functions/ /opt/hue-emulator/functions/
RUN cp -r /diyhue-master/BridgeEmulator/lights/ /opt/hue-emulator/lights/
RUN cp -r /diyhue-master/BridgeEmulator/sensors/ /opt/hue-emulator/sensors/
RUN cp -r /diyhue-master/BridgeEmulator/HueObjects/ /opt/hue-emulator/HueObjects/
RUN cp -r /diyhue-master/BridgeEmulator/services/ /opt/hue-emulator/services/
RUN cp -r /diyhue-master/BridgeEmulator/configManager/ /opt/hue-emulator/configManager/
RUN cp -r /diyhue-master/BridgeEmulator/logManager/ /opt/hue-emulator/logManager/
RUN mv /diyhue-master/BridgeEmulator/HueEmulator3.py /opt/hue-emulator/
RUN mv /diyhue-master/BridgeEmulator/githubInstall.sh /opt/hue-emulator/
RUN mv /diyhue-master/BridgeEmulator/githubUIInstall.sh /opt/hue-emulator/
RUN mv /diyhue-master/BridgeEmulator/genCert.sh /diyhue-master/BridgeEmulator/openssl.conf	/opt/hue-emulator/


RUN curl -sL -o diyHueUI.zip https://github.com/diyhue/diyHueUI/releases/latest/download/DiyHueUI-release.zip
RUN mkdir diyhueUI
RUN unzip -qo diyHueUI.zip -d diyhueUI
RUN rm diyHueUI.zip
RUN mv /diyhueUI/index.html			/opt/hue-emulator/flaskUI/templates/
RUN cp -r /diyhueUI/static			/opt/hue-emulator/flaskUI/
RUN rm -r /diyhueUI/static

RUN apk --no-cache add --virtual build-deps gcc git make musl-dev \
	&& git clone https://github.com/wolfcw/libfaketime \
	&& cd libfaketime \
	&& make \
	&& mv src/*.so* /lib && mv src/faketime /bin \
	&& cd - \
	&& rm -rf libfaketime \
	&& apk del build-deps

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
	org.opencontainers.image.source="" \
	org.opencontainers.image.documentation="" \
	org.opencontainers.image.created=${BUILD_DATE} \
	org.opencontainers.image.revision=${BUILD_REF} \
	org.opencontainers.image.version=${BUILD_VERSION}

CMD [ "./run.sh" ]
