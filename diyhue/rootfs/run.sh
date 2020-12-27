#!/usr/bin/with-contenv bashio

CONFIG_PATH=/data/options.json

export MAC="$(bashio::config 'mac')"
export CONFIG_LOCATION="$(bashio::config 'config_path')"
export DEBUG="$(bashio::config 'debug')"
export DECONZ="$(bashio::config 'deconz_ip')"

python3 -u /opt/hue-emulator/HueEmulator3.py --docker
