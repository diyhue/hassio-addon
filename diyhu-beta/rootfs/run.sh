#!/usr/bin/with-contenv bashio

CONFIG_PATH=/data/options.json

export MAC="$(bashio::config 'mac')"
export CONFIG_PATH="$(bashio::config 'config_path')"
export DEBUG="$(bashio::config 'debug')"

if [[ ! -z "$(bashio::config 'deconz_ip')" ]]; then
    export DECONZ="$(bashio::config 'deconz_ip')"
fi

export NO_SERVE_HTTPS="$(bashio::config 'no_serve_https')"

if [[ -d $CONFIG_PATH ]]; then
    echo "$CONFIG_PATH exists."
else
    mkdir -p $CONFIG_PATH
    echo "$CONFIG_PATH created."
fi

echo "Your Architecture is $BUILD_ARCHI"

if [ "$NO_SERVE_HTTPS" = "true" ] ; then
    python3 -u /opt/hue-emulator/HueEmulator3.py --docker --no-serve-https
else 
    python3 -u /opt/hue-emulator/HueEmulator3.py --docker
fi
