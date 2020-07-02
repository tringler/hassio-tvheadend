ARG BUILD_FROM=homeassistant/base
FROM ${BUILD_FROM}

RUN \
echo "[INFO] Adding Repos Homegear" && \
RUN echo "http://nl.alpinelinux.org/alpine/v3.4/community" >> /etc/apk/repositories
RUN echo "@edge http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

RUN echo "[INFO] Installing TVHeadend" && \
RUN apk add --update libhdhomerun-dev \
    tvheadend-git@edge \
    tvheadend-git-dvb-scan@edge \
    tvheadend-git-satellites-xml@edge \
    && rm -rf /var/cache/apk/*

COPY run.sh /run.sh
RUN chmod +x /run.sh
ENTRYPOINT ["/bin/bash", "-c", "/run.sh"]

# Labels
LABEL \
    io.hass.name="TVHeadend" \
    io.hass.description="TVHeadend Add-On" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="https://github.com/tringler" \
    org.label-schema.description="TVHeadend Add-On" \
    org.label-schema.build-date=${BUILD_DATE} \
    org.label-schema.name="TVHeadend" \
    org.label-schema.schema-version="0.1" \
    org.label-schema.url="https://github.com/tringler/hassio-tvheadend" \
    org.label-schema.usage="https://github.com/tringler/hassio-tvheadend" \
    org.label-schema.vcs-ref=${BUILD_REF} \
    org.label-schema.vcs-url="https://github.com/tringler/hassio-tvheadend" \
    org.label-schema.vendor="https://github.com/tringler"