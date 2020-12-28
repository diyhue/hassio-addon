#!/usr/bin/with-contenv bashio

CONFIG_PATH=/data/options.json

export MAC="$(bashio::config 'mac')"
export CONFIG_LOCATION="$(bashio::config 'config_path')"
export DEBUG="$(bashio::config 'debug')"

if bashio::config.has_value 'deconz_ip'; then
    export DECONZ="$(bashio::config 'deconz_ip')"
fi

mkdir -p ${CONFIG_LOCATION}

if [ -f "${CONFIG_LOCATION}/config.json" ]; then
    echo "${CONFIG_LOCATION}/config.json exists."
    cp -p ${CONFIG_LOCATION}/config.json /opt/hue-emulator/config.json
fi
ln -sf /opt/hue-emulator/config.json /config/diyhue/config.json

python3 -u /opt/hue-emulator/HueEmulator3.py --docker
