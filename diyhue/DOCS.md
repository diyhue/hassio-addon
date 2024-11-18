# Home Assistant Add-on: diyHue

The Home Assistant diyHue Add-on allows users to run a fully working diyHue instance right inside Home Assistant. With this Add-on you can manage all your Genuine Hue Lightbulbs, Sensors and Switches aswell as add third-party devices right from inside Home Assistant.

## Installation

### NOTE: Installation will take some Minutes! Be Patience =)

The installation process is pretty easy and straight forward, like for any other third-party Home Assistang Add-on.

Add the repository URL under **Supervisor → Add-on store → ⋮ → Manage add-on repositories**:

    https://github.com/diyhue/hassio-addon


**Important** After Install & before starting diyHue, edit the Config according to the Docs below. If you start diyHue with the default MAC or a wrong MAC the Certificate for Linking Official Apps is generated wrong and you get a error upon linking.
In that case:

- Stop diyHue
- delete cert.pem in _/config/diyhue_ dir
- edit mac
- restart diyHue

## Configuration

**Note**: _Remember to restart the add-on when the configuration is changed._

Example add-on configuration:

```yaml
config_path: /config/diyhue
mac: "XX:XX:XX:XX:XX:XX"
debug: true
no-serve-https: false
```

**Note**: _This is just an example, don't copy and paste it! Create your own!_

### Option: `config_path`

The `config_path` option controls the folder where your diyHue config gets stored. It has to start with **/config** and i highly recommend to name the folder **/config/diyhue**.

### Option: `mac`

The mac-address of your interface (device) you use to connect to you network.
**You can not fake a Mac here, since it is used for original software (APP) to authenticate the Emulated Bridge!**

**Note**: You have to stick to this format `XX:XX:XX:XX:XX:XX`.

### Option: `debug`

If you turn the debug option to true you will get extended logs in the output section of the add-on.

Valid values: `false`, `true`.

### Option: `no-serve-https`

You have to set this value to true if you are running hassio under https. Hassio doesn't allow the usage of SSL on the websocket at the moment. So you have to force diyhue to not use https.

Valid values: `false`, `true`.


## Sidepanel Link

Go to settings > Dashboards > Add Dashboards > Webpage
For url enter `http://homeassistant.local:80`
Hit next.
For Title enter `diyHue`
For Icon enter `mdi:home-lightbulb`
Hit create.


## Known issues and limitations

-    No special limitations at the moment. ;)

## Changelog & Releases

This repository keeps a change log using [GitHub's releases][releases] functionality. The format of the log is based on [Keep a Changelog][keepchangelog].

Releases are based on [Semantic Versioning][semver], and use the format of `MAJOR.MINOR.PATCH`. In a nutshell, the version will be incremented based on the following:

-    `MAJOR`: Incompatible or major changes.
-    `MINOR`: Backwards-compatible new features and enhancements.
-    `PATCH`: Backwards-compatible bugfixes and package updates.

## Support

Got questions?

Please use GitHub, Slack or Discourse, other platforms are not checked by the maintainers.

You have several options to get them answered:

-    The [Home Assistant Discord chat server][discord-ha] for general Home Assistant discussions and questions.
-    The Home Assistant [Community Forum][forum].
-    The diyHue Discord Channel [diyHue Discord](https://diyhue.discourse.group)
-    The diyHue Slack Channel [diyHue Slack](https://diyhue.slack.com/)

You could also open an issue here:
[For HA related issues](https://github.com/diyhue/hassio-addon/issues).
[For DiyHue related issues](https://github.com/diyhue/diyHue/issues).


## Authors & contributors

The original setup of this repository is by Max Beckenbauer.
diyHue adopted his work and is now releasing the official addon upon his work.
**Thank you Max**

For a full list of all authors and contributors, check credits section of the main README.md.

[discord-ha]: https://discord.gg/c5DvZ4e
[forum]: https://community.home-assistant.io
[releases]: https://github.com/diyhue/diyHue/releases

