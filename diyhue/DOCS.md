# Home Assistant Add-on: diyHue

The Home Assistant diyHue Add-on allows users to run a fully working diyHue instance right inside Home Assistant. So there is no more need for running a separate instance of diyHue on a separate device. With this Add-on you can manage all your Philips Hue lightbulbs, sensors and switches together
with some third-party devices right from inside Home Assistant.

## Installation

The installation process is pretty easy and straight forward, like for any other third-party Home Assistang Add-on. Add the repository URL under **Supervisor → Add-on store → ⋮ → Manage add-on repositories**:

    https://github.com/MaxBec/diyHue-hassio

The repository includes two add-ons:

-    **diyHue** is a stable release that tracks the released versions of zigbee2mqtt.
-    **homegear** tracks the `dev` branch of zigbee2mqtt, so you can install the edge version if there are features or fixes in the dev branch that are not yet released.

## Configuration

**Note**: _Remember to restart the add-on when the configuration is changed._

Example add-on configuration:

```yaml
log_level: info
name: HomeAssistant
bitrate: 320
username: frenck@example.com
password: MySpotifyPassword
```

**Note**: _This is just an example, don't copy and paste it! Create your own!_

### Option: `log_level`

The `log_level` option controls the level of log output by the addon and can be changed to be more or less verbose, which might be useful when you are dealing with an unknown issue. Possible values are:

-    `trace`: Show every detail, like all called internal functions.
-    `debug`: Shows detailed debug information.
-    `info`: Normal (usually) interesting events.
-    `warning`: Exceptional occurrences that are not errors.
-    `error`: Runtime errors that do not require immediate action.
-    `fatal`: Something went terribly wrong. Add-on becomes unusable.

Please note that each level automatically includes log messages from a more severe level, e.g., `debug` also shows `info` messages. By default, the `log_level` is set to `info`, which is the recommended setting unless you are troubleshooting.

Setting the `log_level` to `debug` will also turn on debug mode on the Spotify service.

### Option: `name`

The name of your device (the Spotify Connect target), as shown on the official Spotify clients.

**Note**: \_May only contain letters, numbers, hyphens (`-`) and dots (`.`)

### Option: `bitrate`

The bitrate Spotify should use. The higher, the better the sound quality, however, the add-on consumes more data.

Valid values: `96`, `160` (default) or `320`.

### Option: `username`

**IMPORTANT**: _This requires a Spotify Premium account!_

The username you use to login to your Spotify Premium account. Setting this will bind the add-on to your account exclusively.

This can be helpful when experiencing discovery issues on your network or to disallow guests on your network to use the add-on.

### Option: `password`

The password you use to login to your Spotify Premium account.

## Known issues and limitations

-    This add-on does support ARM-based devices, nevertheless, they must at least be an ARMv7 device. (Raspberry Pi 1 and Zero is not supported).
-    This add-on requires a Spotify Premium account.

## Changelog & Releases

This repository keeps a change log using [GitHub's releases][releases] functionality. The format of the log is based on [Keep a Changelog][keepchangelog].

Releases are based on [Semantic Versioning][semver], and use the format of `MAJOR.MINOR.PATCH`. In a nutshell, the version will be incremented based on the following:

-    `MAJOR`: Incompatible or major changes.
-    `MINOR`: Backwards-compatible new features and enhancements.
-    `PATCH`: Backwards-compatible bugfixes and package updates.

## Support

Got questions?

You have several options to get them answered:

-    The [Home Assistant Community Add-ons Discord chat server][discord] for add-on support and feature requests.
-    The [Home Assistant Discord chat server][discord-ha] for general Home Assistant discussions and questions.
-    The Home Assistant [Community Forum][forum].
-    Join the [Reddit subreddit][reddit] in [/r/homeassistant][reddit]

You could also [open an issue here][issue] GitHub.

## Authors & contributors

The original setup of this repository is by [Franck Nijhof][frenck].

For a full list of all authors and contributors, check [the contributor's page][contributors].

## License

MIT License

Copyright (c) 2018-2020 Franck Nijhof

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

[contributors]: https://github.com/hassio-addons/addon-spotify-connect/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-on-spotify-connect/61210?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/addon-spotify-connect/issues
[keepchangelog]: http://keepachangelog.com/en/1.0.0/
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-spotify-connect/releases
[semver]: http://semver.org/spec/v2.0.0.htm
