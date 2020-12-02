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

wget https://github.com/ARMmbed/mbedtls/archive/1ab9b5714852c6810c0a0bfd8c3b5c60a9a15482.zip
unzip 1ab9b5714852c6810c0a0bfd8c3b5c60a9a15482.zip
cd mbedtls-1ab9b5714852c6810c0a0bfd8c3b5c60a9a15482/
wget https://raw.githubusercontent.com/mariusmotea/diyHue/master/BridgeEmulator/ssl_server2_diyhue.c
make no_test
gcc -I./include ssl_server2_diyhue.c -o ../entertain-srv -L./library -lmbedtls -lmbedx509 -lmbedcrypto
cd ..

rm -f 1ab9b5714852c6810c0a0bfd8c3b5c60a9a15482.zip
rm-f mbedtls-1ab9b5714852c6810c0a0bfd8c3b5c60a9a15482

#echo "Got file suffix: $SELECTED"
#mv ./ssl_server2_diyhue ./entertain-srv
mv binaries/coap-client-$SELECTED ./coap-client-linux

# Fix permissions vor hue Entertain
chmod a+x ./entertain-srv
chmod a+x ./coap-client-linux

# echo "DEBUG OUTPUT:"
# ldd binaries/entertainment-aarch64
# echo "DEBUG OUTPUT STOP"
# md5sum binaries/entertainment-aarch64
# echo "END OF TEST"

# echo "Files in out folder"
ls -la ./
