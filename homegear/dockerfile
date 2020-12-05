FROM debian:buster-slim

# Installation routine
RUN apt-get update && apt-get -y install apt-transport-https wget ca-certificates apt-utils gnupg libzip4 libavahi-client3 libavahi-client-dev insserv
RUN apt-get install nano
RUN \
	touch /tmp/HOMEGEAR_STATIC_INSTALLATION; \
	touch /.dockerenv; \
	wget https://apt.homegear.eu/Release.key && apt-key add Release.key && rm Release.key; \
	echo 'deb https://apt.homegear.eu/Debian/ buster/' >> /etc/apt/sources.list.d/homegear.list; \
	apt-get update && apt-get -y install libhomegear-node homegear homegear-management homegear-webssh homegear-adminui homegear-ui homegear-nodes-core homegear-nodes-extra homegear-homematicbidcos homegear-homematicwired homegear-insteon homegear-max homegear-philipshue homegear-sonos homegear-kodi homegear-ipcam homegear-beckhoff homegear-knx homegear-enocean homegear-intertechno homegear-rsl homegear-rs2w homegear-mbus homegear-zwave homegear-zigbee homegear-ccu homegear-easyled homegear-easyled2 homegear-easycam homegear-influxdb; \
	rm -f /etc/homegear/dh1024.pem; \
	rm -f /etc/homegear/homegear.crt; \
	rm -f /etc/homegear/homegear.key; \
	mv /etc/homegear /etc/homegear.config; \
	mv /var/lib/homegear /var/lib/homegear.data; \
	apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#VOLUME ["/etc/homegear", "/var/lib/homegear", "/var/log/homegear"]

COPY start.sh /start.sh
RUN chmod +x /start.sh
ENTRYPOINT ["/bin/bash", "-c", "/start.sh"]

EXPOSE 2001 2002 2003

# Build arguments
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION

# Labels
LABEL \
    io.hass.name="Homegear" \
    io.hass.description="Fully configurable homegear container." \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="Max Beckenbauer <max.bec92@gmail.com>" \
    org.opencontainers.image.title="diyHue" \
    org.opencontainers.image.description="Fully configurable homegear container." \
    org.opencontainers.image.vendor="Max Beckenbauer" \
    org.opencontainers.image.authors="Max Beckenbauer <max.bec92@gmail.com>" \
    org.opencontainers.image.licenses="MIT" \
    org.opencontainers.image.url="" \
    org.opencontainers.image.source="" \
    org.opencontainers.image.documentation="" \
    org.opencontainers.image.created=${BUILD_DATE} \
    org.opencontainers.image.revision=${BUILD_REF} \
    org.opencontainers.image.version=${BUILD_VERSION}
