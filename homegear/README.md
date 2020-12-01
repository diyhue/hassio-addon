# Homegear

This plugin heavily uses the original Docker Image from the Homegear project.\
I only extended and modified the scripts for working as a HASS plugin.

Primarly I build it for my own, because I don't want to replace my MAX! Devices and don't want to power two raspberry PI at home

Feel free to use my AddOn, but keep in mind it comes absolutely without warranty and support \
(of course feel free to give feedback on githab, I will do my best to fix problems).

# Usage

1. Add this repo to your HASS Repomanager
2. Install the Plugin and start it (There are no HASSIO Addon Configuration parameters yet)
3. At first boot, the Addon creates a homegear directory in your config folder. You have to configure it like a stand alone homegear system.
4. Restart the AddOn
5. For communicaton with hass, add a CCU config to your /config/configuration.yaml (Includeing the Port 2001 for RPC Communication)

# WebGui

The Admin GUI is available via "http://your-hass:2001/admin"

# Restricions

You can't use the CLI Configuration. You can add devices via ADMIN-UI (tested with MAX!)

# Examples

#### configuration.yaml

```yaml
#Homematic (Homegear)
homematic:
     interfaces:
          wireless:
               host: 10.4.4.113
               resolvenames: metadata
               port: 2001
```
