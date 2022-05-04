<div align="center">
<img src="https://github.com/diyhue/hassio-addon/blob/master/images/diyhue-hassio.png">
<h1>Home Assistant Add-on: diyHue</h1>
<br>
<p>Run <a href="https://diyhue.org">diyHue</a> as a Home Assistant Add-on</p>
</div>

## About

diyHue provides a Ecosystem for several Smart Home Solutions, eliminating the need for vendor specific Bridges and Hardware. Written in Python and Open Source, you are now able to import and control all your Lights and Sensors into one System. Lightweight and resource friendly, to run on small
devices like the RPi .... 24/7

The Best part? No Cloud connection by Design!

Enjoy your diyHue enlighted Home.

If you've found the Add-on helpful or useful, then please consider throwing a coffee my way to help support my work. As i am a student and would like to invest more time and effort in this project this would really help me:

[![ko-fi](https://www.ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/diyhue)

![diyHue ecosystem][img-ecosystem]

## Installation

The installation process is pretty easy and straight forward, like for any other third-party Home Assistang Add-on.

Add the repository URL under **Supervisor → Add-on store → ⋮ → Manage add-on repositories**:

    https://github.com/diyhue/hassio-addon


## Changelog

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/).

All notable changes to this project will be documented in the [CHANGELOG.md][changelog] file.

Version for releases is based on [diyHue](https://github.com/diyhue/diyHue) format: `X.Y.Z`.

Any changes on the addon that do not require a new version of [diyHue](https://github.com/diyhue/diyHue) will use the format: `X.Y.Z.A` where `X.Y.Z` is fixed on the diyHue release version and `A` is related to the addon.

Edge version will not maintain a CHANGELOG and doesn't have a version.

## Issues

If you find any issues with the add-on, please check the [issue tracker](https://github.com/MaxBec/hassio-diyHue/issues) for similar issues before creating one. If your issue is regarding specific devices or, more generally, an issue that arises after diyHue has successfully started, it should
likely be reported in the [diyHue issue tracker](https://github.com/diyhue/diyHue/issues).

Feel free to create a PR for fixes and enhancements.

## Support

All documentation and instructions can be found over at [diyhue.readthedocs.io](https://diyhue.readthedocs.io/)

If you need help with diyHue you can get support from other users, aswell as the maintainer.

### Slack [![JoinSlack](https://img.shields.io/badge/Join%20us-on%20Slack-green.svg)](https://join.slack.com/t/diyhue/shared_invite/enQtNzAwNDE1NDY2MzQxLTljNGMwZmE0OWRhNDIwM2FjOGM1ZTcxNjNmYjc5ZmE3MjZlNmNjMmUzYmRkZjhhOGNjOTc4NzA0MGVkYzE2NWM) [![SlackStatus](https://slackinvite.squishedmooo.com/badge.svg?colorB=8ebc06)](https://slackinvite.squishedmooo.com/)

Use Slack for a general chat or fast live support.

However: Since Slack is faster at providing live Support but not as good when it comes to save and show known Issues, we kindly ask you to open a Topic at our Discourse group. This will provide Help for others in the future.

### Discourse [![Discourse](https://img.shields.io/discourse/users?server=https%3A%2F%2Fdiyhue.discourse.group)](https://diyhue.discourse.group)

Our Board might already have your fix and answer ready. Have a look!

> General Note: Please provide some Logs to make it easier for all of us. Enable Debug by manually starting diyHue with additional `--debug true` argument.

<!--## Stability

Starting in Dec. 2020 we will introduce one Master and one Dev Branch. The Master will have the most stable code.

If you want to tinker and experiment you can try the dev Branch. Active development will take place here.

You want to get the latest features? Try the experimental Branch. Use at own Risk!

-->

<!-- All the lights in my house are controlled by this solution so the stability is very important to me as there is no turning back to classic illumination (all switches were replaced with Ikea Trådfri Remotes and holes covered). However, I don't use all the functions, so I'm unable to perform full tests on every change. What I do currently use is Deconz with all Trådfri devices (lights + sensors), Xiaomi Motion Sensor, native ESP8266 bulbs, ESP8266 + WS2812B strips, and Xiaomi YeeLight color bulbs. -->


Please post on our [Slack team](https://slackinvite.squishedmooo.com/) any other device/application that you find to work with this emulator.

<!-- [![Youtube Demo](https://img.youtube.com/vi/c6MsG3oIehY/0.jpg)](https://www.youtube.com/watch?v=c6MsG3oIehY)


<!-- ## qtHue

<!-- You also may want to see my new project [qtHue](https://github.com/mariusmotea/qtHue) that provides a simple user interface for controlling the lights.
![qtHue](https://github.com/mariusmotea/qtHue/blob/master/Screenshot.png?raw=true) -->

## Contribute

diyHue is Opensource and maintained by volunteers in their free time. You are welcome to contribute and become a recognised member of the diyHue community. Feel free to add PR and Commits to our Dev Branch. If you are experienced in

-    Webdesign
-    Python
-    Arduino
-    Coding in general

We highly appreciate your support, making diyHue even better!

## Credits

-    Ben ([@cheesemarathon](https://github.com/cheesemarathon)) All fancy github integrations
-    [Stephan van Rooij](https://github.com/svrooij) - zigbee2mqtt integration
-    [@avinashraja98](https://github.com/avinashraja98) - Hue Entertainment server
-    Federico Zivolo ([@FezVrasta](https://github.com/FezVrasta)) Internal WebGUI
-    [@J3n50m4t](https://github.com/J3n50m4t) - Yeelight integration
-    Martin Černý ([@mcer12](https://github.com/mcer12)) - Yeelight color bulb
-    probonopd https://github.com/probonopd/ESP8266HueEmulator
-    sidoh https://github.com/sidoh/esp8266_milight_hub
-    StefanBruens https://github.com/StefanBruens/ESP8266_new_pwm
-    Cédric @ticed35 for linkbutton implementation
-    [@cheesemarathon](https://github.com/cheesemarathon) - Help with Docker images
-    [@Mevel](https://github.com/Mevel) - 433Mhz devices
-    [@Nikfinn99](https://github.com/Nikfinn99) - PCB designs
-    [@crankyoldgit](https://github.com/crankyoldgit) - IR Remote library

## Additional Projects and Ideas

Hue living color light project for 3D printing: [Thingiverse 2773413](https://www.thingiverse.com/thing:2773413)

## License

[![license](https://img.shields.io/badge/license-GPLv3%2FApache%202.0%2FCC%20BY--SA%204.0-blue.svg)](https://github.com/diyhue/diyHue/blob/master/LICENSE.md)

[changelog]: https://github.com/MaxBec/hassio-diyHue/blob/master/diyhue/CHANGELOG.md
[img-ecosystem]: https://raw.githubusercontent.com/diyhue/diyhue.github.io/master/assets/images/hue-map.png
