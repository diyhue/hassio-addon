# Home Assistant Add-on: diyHue

The Home Assistant diyHue Add-on allows users to run a fully working diyHue instance right inside Home Assistant. So there is no more need for running a separate instance of diyHue on a separate device. With this Add-on you can manage all your Philips Hue lightbulbs, sensors and switches together
with some third-party devices right from inside Home Assistant.

## Installation

The installation process is pretty easy and straight forward, like for any other third-party Home Assistang Add-on.

Add the repository URL under **Supervisor → Add-on store → ⋮ → Manage add-on repositories**:

    https://github.com/MaxBec/diyHue-hassio

The repository includes two add-ons:

-    **diyHue** is a stable release that tracks the released versions of diyHue.
-    **diyHue-beta** tracks the `dev` branch of diyHue, so you can install the edge version if there are features or fixes in the dev branch that are not yet released. _NOT AVAILABLE YET_

## Configuration

**Note**: _Remember to restart the add-on when the configuration is changed._

Example add-on configuration:

```yaml
config_path: /config/diyhue
mac: "XX:XX:XX:XX:XX:XX"
debug: true
no-serve-https: false
deconz_ip: 192.168.0.0
```

**Note**: _This is just an example, don't copy and paste it! Create your own!_

### Option: `config_path`

The `config_path` option controls the folder where your diyHue config gets stored. It has to start with **/config** and i highly recommend to name the folder **/config/diyhue**.

### Option: `mac`

The mac-address of your device.

**Note**: You have to stick to this format `XX:XX:XX:XX:XX:XX`.

### Option: `debug`

If you turn the debug option to true you will get extended logs in the output section of the add-on.

Valid values: `false`, `true`.

### Option: `no-serve-https`

You have to set this value to true if you are running hassio under https. Hassio doesn't allow the usage of SSL on the websocket at the moment. So you have to force diyhue to not use https.

Valid values: `false`, `true`.

### Option: `deconz_ip`

Here you can enter the IP-Address of your Deconz instance.

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

You have several options to get them answered:

-    The [Home Assistant Discord chat server][discord-ha] for general Home Assistant discussions and questions.
-    The Home Assistant [Community Forum][forum].
-    The diyHue Discord Channel [diyHue Discord](https://diyhue.discourse.group)
-    The diyHue Slack Channel [diyHue Slack](https://join.slack.com/t/diyhue/shared_invite/enQtNzAwNDE1NDY2MzQxLTljNGMwZmE0OWRhNDIwM2FjOGM1ZTcxNjNmYjc5ZmE3MjZlNmNjMmUzYmRkZjhhOGNjOTc4NzA0MGVkYzE2NWM)

You could also [open an issue here](https://github.com/MaxBec/hassio-diyHue/issues) GitHub.

## Authors & contributors

The original setup of this repository is by Max Beckenbauer.

For a full list of all authors and contributors, check credits section of the main README.md.

[discord-ha]: https://discord.gg/c5DvZ4e
[forum]: https://community.home-assistant.io
[keepchangelog]: http://keepachangelog.com/en/1.0.0/
[releases]: https://github.com/diyhue/diyHue/releases
[semver]: http://semver.org/spec/v2.0.0.htm
