#!/usr/bin/with-contenv bashio

CONFIG_PATH=/data/options.json
IP=""

export MAC="$(bashio::config 'mac')"
export CONFIG_PATH="$(bashio::config 'config_path')"
export DEBUG="$(bashio::config 'debug')"
export HTTP_PORT="$(bashio::config 'http_port')"
export HTTPS_PORT="$(bashio::config 'https_port')"
export IP="$(bashio::config 'ip')"


export NO_SERVE_HTTPS="$(bashio::config 'no_serve_https')"

if [[ -d $CONFIG_PATH ]]; then
    echo "$CONFIG_PATH exists."
else
    mkdir -p $CONFIG_PATH
    echo "$CONFIG_PATH created."
fi


echo "Your Architecture is $BUILD_ARCHI"

if [ "$NO_SERVE_HTTPS" = "true" ] ; then
    echo "No serve HTTPS"
    python3 -u /opt/hue-emulator/HueEmulator3.py --docker --no-serve-https --ip "$IP"
else
    echo "Serve HTTPS"
    python3 -u /opt/hue-emulator/HueEmulator3.py --docker --ip "$IP"
fi
