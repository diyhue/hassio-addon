# Home Assistant Add-on: diyHue

diyHue adds a fully compatible Philips Hue emulator to Home-Assistant.

## About

This project emulates a Philips Hue Bridge that is able to control ZigBee lights (using Raspbee module, original Hue Bridge or IKEA Trådfri Gateway), Mi-Light bulbs (using MiLight Hub), Neopixel strips (WS2812B and SK6812) and any cheap ESP8266 based bulb by replacing the firmware with a custom one.
It is written in Python and will run on all small devices such as the Raspberry Pi. Arduino sketches are provided for the Hue Dimmer Switch, Hue Tap Switch and Hue Motion Sensor. Lights are two-way synchronized so any change made from original Philips/Trådfri sensors and switches will also be
applied to the bridge emulator.

If you've found the extension helpful or useful, then please consider throwing a coffee my way to help support my work. As i am a student and would like to invest more time and effort in this project this would really help me.

-    [Ko-Fi Donation to MaxBec](https://ko-fi.com/C0C01XTXB)
-    [PayPal Donation](https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=58GE7PE2EAQAY&source=url)

![diyHue ecosystem](https://raw.githubusercontent.com/diyhue/diyhue.github.io/master/assets/images/hue-map.png)

## Getting Started

**See Documentation tab for more details.**

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
