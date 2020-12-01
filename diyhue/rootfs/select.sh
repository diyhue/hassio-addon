#!/bin/sh

# echo "Target platform is: $TARGETPLATFORM"
# Hassio: armhf, armv7, aarch64, amd64, i386

case "$BUILD_ARCH" in
 "amd64") SELECTED="x86_64" ;;
 "armv7") SELECTED="arm" ;;
 "armhf") SELECTED="arm" ;;
 "aarch64") SELECTED="aarch64" ;;
    *) SELECTED="unsupported" ;;
esac

echo "Got file suffix: $SELECTED"
mv binaries/entertainment-$SELECTED ./entertain-srv
mv binaries/coap-client-$SELECTED ./coap-client-linux

# Fix permissions vor hue Entertain
chmod a+x ./entertain-srv
chmod a+x ./coap-client-linux

echo "DEBUG OUTPUT:"
ldd binaries/entertainment-aarch64
echo "DEBUG OUTPUT STOP"
md5sum binaries/entertainment-aarch64
echo "END OF TEST"

# echo "Files in out folder"
ls -la ./
