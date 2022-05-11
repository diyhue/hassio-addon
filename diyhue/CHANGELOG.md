# Changelog

All notable changes to this project will be documented in this file. The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

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
