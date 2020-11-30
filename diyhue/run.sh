#!/usr/bin/with-contenv bashio

CONFIG_PATH=/data/options.json

export MAC="$(bashio::config 'mac')"
export CONFIG_LOCATION="$(bashio::config 'config_path')"
export DEBUG="$(bashio::config 'debug')"

python3 -u /diyhue/main.py
