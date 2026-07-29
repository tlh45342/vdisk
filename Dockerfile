FROM alpine:3.22

LABEL org.opencontainers.image.title="VDisk" \
      org.opencontainers.image.description="Developmental architecture-independent virtual disk service shim" \
      org.opencontainers.image.authors="Thomas Hamilton" \
      org.opencontainers.image.version="0.0.1"

RUN addgroup -S vdisk && adduser -S -G vdisk vdisk
WORKDIR /opt/vdisk
COPY VERSION /opt/vdisk/VERSION
COPY src/vdisk-shim.sh /usr/local/bin/vdisk-shim
RUN chmod 0755 /usr/local/bin/vdisk-shim
USER vdisk
ENTRYPOINT ["/usr/local/bin/vdisk-shim"]
