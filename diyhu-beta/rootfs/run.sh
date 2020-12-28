#!/usr/bin/with-contenv bashio

CONFIG_PATH=/data/options.json

export MAC="$(bashio::config 'mac')"
export CONFIG_PATH="$(bashio::config 'config_path')"
export DEBUG="$(bashio::config 'debug')"

if bashio::config.has_value 'deconz_ip'; then
    export DECONZ="$(bashio::config 'deconz_ip')"
fi

python3 -u /opt/hue-emulator/HueEmulator3.py --docker
