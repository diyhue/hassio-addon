# Changelog

All notable changes to this project will be documented in this file. The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2.0.28 - 1.12.2024]
### update
    - update wled
### info
    - rescan lights if error during entertainment `Entertainment Service was syncing and has timed out, stopping server and clearing state'segment_start'`
    - see main repo for more info
    - disable backup if you get a error "Unsuccessful websocket message"

## [2.0.27 - 1.12.2024]
### add
    - Add dummy
    - Add ip setting to config
### update
    - update wled
### info
    - see main repo for more info
    - disable backup if you get a error "Unsuccessful websocket message"

## [2.0.26 - 24.11.2024]
### add
    - Add effect_v2
    - Add effects to mqtt
### info
    - disable backup if you get a error "Unsuccessful websocket message"

## [2.0.25 - 18.11.2024]
### fix
    - fix addon install

## [2.0.24 - 18.11.2024]
### fix
    - fix addon install

## [2.0.23 - 18.11.2024]
### fix
    - fix addon install

## [2.0.22 - 18.11.2024]
### fix
    - fix addon install

## [2.0.21 - 18.11.2024]
### remove
 - remove deconz from options, setup via webui, see main repo for more info
### update
 - move to vite, see main repo for more info

## [2.0.20 - 26.10.2024]
### Fix
 - fix unsupported operand type(s) for /: 'NoneType' and 'int'
### Add
 - Add XY light

## [2.0.19 - 1.10.2024]
### Fix
 - fix AttributeError: 'list' object has no attribute 'name', see main repo for more info

## [2.0.18 - 27.9.2024]
### Fix
 - fix ZeroDivisionError: division by zero, see main repo for more info

## [2.0.17 - 21.9.2024]
### Fix
 - Allot of fixes, see main repo for more info

## [2.0.16 - 2.9.2024]
### Fix
 - Allot of fixes, see main repo for more info

## [2.0.15 - 10.8.2024]
### Fix
 - fix grouped_light owner missing

## [2.0.14 - 24.3.2024]
### Fix
 - fix libfaketime install error

## [2.0.13 - 10.3.2024]
### add
 - add update service

## [2.0.12 - 28.2.2024]
### update
 - fix install issue

 ## [2.0.11 - 18.2.2024]
### add
 - Updated webUi

## [2.0.9 - 17.06.2023]
### Update
 - Emulated Hue SW Version and API Version updated

### Add
 - Elgato Protocol (Elgato Key Light)
 - RDM002 Support added (Hue Tap Dial)

### Fix
 - HA Error (invalid LightMode)
 - State only Battery output when not Null



## [2.0.8 - 17.03.2023]
### Fix
 - Hue Sync issues
 - improve minor bugs


## [2.0.7 - 15.10.2022]
### Fix
 - Connection to Hue APP failed on certain systems because Certificate could not be saved into missing Directory.


## [2.0.6 - 09.10.2022]
### Fix
 - Bug in MQTT fixed when using zigbee2mqtt. BRI Change now reflects Hue API behavior.


## [2.0.5 - 29.9.2022]
### Update
 - Update Emulated Software Version to "1953188020"
 - Minor Fixes


## [2.0.4 - 01.7.2022]

### Update
 - Fixed Home Assistant lights weren't detected with the correct type
 - Fixed Home Assistant brightness didn't work


## [2.0.3 - 29.6.2022]

### Update
 - update swversion to 1952086020


## [2.0.2 - 24.6.2022]

### Update
 - Update Config options
 - Enable "No Serve HTTPS"
 - minor Ui fixes

## [2.0.1 - 11.05.2022]

### Added

- Add Sidepanel Topic in Docs


## [2.0.0 - 05.05.2022]

Official diyHue Hassio Addon Release

This addon is only compatible with the "BETA" of the initial addon Release by Max.
At this point we would like to thank Max for his great work upon we will continue this Addon.
Max and diyhue agreed to make this Addon official.

### Changed
- Repo URL to https://github.com/diyhue/hassio-addon
- Build upon latest diyHue Master Release


## [1.4.1 - 05.04.2021]

### Changed

-    Deleted the host_network entry in the config.json. #16

### Fixed
- Added changes from the diyhue flask repo. web-ui is now flaskUI.

## [1.4.0 - 25.3.2021]

### Added

-    Updated the diyhue version to the latest master branch.

## [1.3.2 - 8.02.2021]

### Fixed

-    Issue with alpine apk commands. Results in docker build error.

## [1.3.1 - 18.01.2021]

### Fixed

-    Issue with https connection. Hassio doesn't allow to use SSL with websocket at the moment.

### Added

-    Option to force no https usage with `no-serve-https: true`

## [1.2.0 - 30.12.2020

Changes to the config.json creation and saving procedure.

### Fixed

-    Correct creation of the config.json
-    Correct path of the config.json

## [1.1.0] - 26.12.2020

Big update for the Add-on. diyHue moved there default branch from master-refactor to master. With this change there is a completely new folder structure. So there was the need do adapt this Add-on as well.

### Fixed

-    Minor fixes for the final release of the Add-on.

### Added

-    Merged the whole Add-on to the new master branch of diyhue.
-    New Readme file for the repository and the Add-on
-    New logo specifically for the hassio Add-on
