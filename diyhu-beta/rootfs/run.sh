#!/usr/bin/with-contenv bashio

CONFIG_PATH=/data/options.json

export MAC="$(bashio::config 'mac')"
export CONFIG_LOCATION="$(bashio::config 'config_path')"
export DEBUG="$(bashio::config 'debug')"

if bashio::config.has_value 'deconz_ip'; then
    export DECONZ="$(bashio::config 'deconz_ip')"
fi

mkdir -p ${CONFIG_LOCATION}
ln -s /config/diyhue/config.json /config/diyhue/config.json

python3 -u /opt/hue-emulator/HueEmulator3.py --docker
