
# 🌟 New release: v1.9.1 🌟
### Take a look at what has changed [here](https://github.com/iakmds/librecamera/releases/tag/v1.9.1)!

<br><br>

<p>
  <a href="https://github.com/iakmds/librecamera/releases/latest" alt="Release">
  <img src="https://img.shields.io/github/v/release/iakmds/librecamera?style=flat-square" /></a>

  <a href="https://f-droid.org/packages/com.iakmds.librecamera" alt="F-Droid">
  <img src="https://img.shields.io/f-droid/v/com.iakmds.librecamera?style=flat-square" /></a>

  <a href="https://github.com/iakmds/librecamera/issues" alt="Issues">
  <img src="https://img.shields.io/github/issues/iakmds/librecamera?style=flat-square" /></a>

  <a href="https://github.com/iakmds/librecamera/pulls" alt="Pull requests">
  <img src="https://img.shields.io/github/issues-pr/iakmds/librecamera?style=flat-square" /></a>

  <a href="https://github.com/iakmds/librecamera/contributors" alt="Contributors">
  <img src="https://img.shields.io/github/contributors/iakmds/librecamera?style=flat-square" /></a>

  <a href="https://github.com/iakmds/librecamera/network/members" alt="Forks">
  <img src="https://img.shields.io/github/forks/iakmds/librecamera?style=flat-square" /></a>

  <a href="https://github.com/iakmds/librecamera/stargazers" alt="Stars">
  <img src="https://img.shields.io/github/stars/iakmds/librecamera?style=flat-square" /></a>

  <a href="https://github.com/iakmds/librecamera/blob/master/LICENSE" alt="License">
  <img src="https://img.shields.io/github/license/iakmds/librecamera?style=flat-square" /></a>
  
  <a href="https://hosted.weblate.org/engage/librecamera/">
  <img src="https://hosted.weblate.org/widgets/librecamera/-/svg-badge.svg" alt="Translation status" /></a>
</p>

<p align="center">
  <a href="https://github.com/iakmds/librecamera">
    <img src="https://github.com/iakmds/librecamera/blob/master/fastlane/metadata/android/en-US/images/icon.png" alt="Libre Camera app icon" height="128">
  </a>
</p>

<h1 align="center">Libre Camera</h1>
<p align="center">A free and open source camera app for Android written in Flutter and Dart licensed under the <a href="LICENSE">GPLv3</a></p>

<p align="center">
    <a href="https://f-droid.org/packages/com.iakmds.librecamera">
    <img src="https://fdroid.gitlab.io/artwork/badge/get-it-on.png"
    alt="Get it on F-Droid"
    height="80">
  </a>
</p>

<details open="open">
  <summary><h2 style="display: inline-block">Table of Contents</h2></summary>
  <ol>
    <li>
      About Libre Camera
      <ul>
        <li><a href="#screenshots">Screenshots</a></li>
        <li><a href="#download">Download</a></li>
        <li><a href="#features">Features</a></li>
      </ul>
    </li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li>
      <a href="#contributing">Contributing</a>
      <ul>
        <li><a href="#translate">Translate</a></li>
        <li><a href="#bug-reporting-or-feature-requests">Bug reporting or feature requests</a></li>
        <li><a href="#code">Code</a></li>
      </ul>
    </li>
    <li><a href="#packages-used">Packages used</a></li>
    <li><a href="#license">License</a></li>
  </ol>
</details>

# Screenshots
<p float="left">
  <img src="https://github.com/iakmds/librecamera/blob/master/fastlane/metadata/android/en-US/images/phoneScreenshots/1.png" alt="Screenshot 1" height="420">
  <img src="https://github.com/iakmds/librecamera/blob/master/fastlane/metadata/android/en-US/images/phoneScreenshots/2.png" alt="Screenshot 2" height="420">
  <img src="https://github.com/iakmds/librecamera/blob/master/fastlane/metadata/android/en-US/images/phoneScreenshots/3.png" alt="Screenshot 3" height="420">
  <img src="https://github.com/iakmds/librecamera/blob/master/fastlane/metadata/android/en-US/images/phoneScreenshots/4.png" alt="Screenshot 4" height="420">
</p>

# Download

You can download Libre Camera on [F-Droid](https://f-droid.org/packages/com.iakmds.librecamera) by tapping on the badge below. Alternatively, download and install the apk directly from the GitHub [releases](https://github.com/iakmds/librecamera/releases) page. Downloading directly from the GitHub releases page will likely download a more recent version (if a new version was published recently) – notice though that the F-Droid and the GitHub versions aren't compatible with one another. You will need to reinstall the app; make sure you remember your settings.

[<img src="https://fdroid.gitlab.io/artwork/badge/get-it-on.png"
    alt="Get it on F-Droid"
    height="80">](https://f-droid.org/packages/com.iakmds.librecamera)
[<img src="https://raw.githubusercontent.com/iakmds/librecamera/master/.github/get-it-on-github.png"
    alt="Get it on GitHub"
    height="80">](https://github.com/iakmds/librecamera/releases/latest)

# Features

- Take pictures and record videos with your rear and front camera
- Privacy: No EXIF metadata saved by default when taking pictures (enable optionally in settings) – without ads, tracking, or unnecessary permissions
- Themes: Material Design with a Dark, Light or system theme
- Multiple languages supported – [Contribute translating your language!](#translate)
- Zoom: Zoom with 2 fingers or with an optional slider
- Timer/Delay: Select a photo capture timer to get ready for your photo
- Flashlight modes: On at capture, Off, Auto, Always on
- Focus: Auto focus, locked focus and manual focus by touching the screen
- Exposure: Auto exposure, locked exposure and manual exposure with an optional slider
- Image compression: Set the compression amount in the settings
- Formats: Switch between 3 camera formats (JPEG, PNG, WebP)
- Resolutions: Switch between different camera resolutions
- Save location: Choose your preferred save location
- Small size (<20 MB)
- Customizable: Open the settings to customize the app to your liking!

# Roadmap

- [ ] More supported languages (See [#translate](#translate) below)
- [ ] [Your features](https://github.com/iakmds/librecamera/issues)
- [ ] Flutter issue: [Allow custom resolution and aspect ratio](https://github.com/flutter/flutter/issues/45665) (Fix [#21](https://github.com/iakmds/librecamera/issues/21))
- [ ] Flutter issue: [Set custom frame rate and bit rate](https://github.com/flutter/flutter/issues/54339) (Fix [#21](https://github.com/iakmds/librecamera/issues/21))
- [ ] Flutter issue: [Switch between multiple cameras](https://github.com/flutter/flutter/issues/91247) (Fix [#18](https://github.com/iakmds/librecamera/issues/18))
- [ ] Flutter issue: [Manual focus distance](https://github.com/flutter/flutter/issues/111476) (Fix [#3](https://github.com/iakmds/librecamera/issues/3))
- [ ] Feature: Add integrated QR-Scanner (Fix [#32](https://github.com/iakmds/librecamera/issues/32))
- [ ] Settings: Add a search bar for the settings page
- [x] (Included in version 1.9.0) Theme: Add a black Dark mode for AMOLED screens
- [x] (Included in version 1.8.0) Feature: Add "photo capture at phone volume button press" as an option in settings
- [x] (Included in version 1.7.0) Flutter issue: [Flip camera while recording](https://github.com/flutter/flutter/issues/82467)
- [x] (Included in version 1.3.0) Feature: Add photo capture delay option
- [x] (Included in version 1.3.0) Feature: Add a capture sound as an option in settings
- [x] [Weblate](https://hosted.weblate.org/engage/librecamera/) integration
- [x] Check tablet support

# Contributing

These are the ways you can contribute to Libre Camera:

<a href="https://hosted.weblate.org/engage/librecamera/">
<img align="right" src="https://hosted.weblate.org/widgets/librecamera/-/287x66-grey.png" alt="Translation status" /></a>

## Translate

<a href="https://hosted.weblate.org/engage/librecamera/"><img src="https://hosted.weblate.org/widgets/librecamera/-/multi-auto.svg" alt="Translation status" /></a>

**Translating guide:** Translations are now handled using [Weblate](https://hosted.weblate.org/engage/librecamera/)! To use Weblate, log into your Weblate account and choose one of the 2 components you want to translate: Either the [app itself](https://hosted.weblate.org/projects/librecamera/librecamera) or the [F-Droid metadata](https://hosted.weblate.org/projects/librecamera/f-droid). Now, select the language you want to translate or add a new language. You will see a list of different strings to choose from; untranslated and unfinished strings will probably be of most interest to you. And finally: Have fun translating!

Before using Weblate you had to translate Libre Camera manually via pull requests. Thank you [@Loughty](https://github.com/Loughty), [@zehrique](https://github.com/zehrique), [@vladkorotnev](https://github.com/vladkorotnev), [@metezd](https://github.com/metezd), [@ZiTAL](https://github.com/ZiTAL) and [@melentan](https://github.com/melentan)!

## Bug Reporting or Feature Requests

Open an issue on GitHub: [Open issue](https://github.com/iakmds/librecamera/issues)

Remember to check for duplicates and try to give important information such as the app version, Android version, etc.

## Code

Feel free to send in a [pull request](https://github.com/iakmds/librecamera/pulls)! To get started with Flutter, follow this link: [https://docs.flutter.dev/get-started/install](https://docs.flutter.dev/get-started/install)

1. Clone this repository
2. Switch to the project's directory and run `flutter pub get` to get all necessary packages. To test the app, run the project in debug mode by selecting an Android device or emulator in your preferred Flutter IDE and running the app in debug mode
3. To build the final app, run the following command in your terminal: `flutter build apk` – the output apk will be generated at `librecamera/build/app/outputs/apk/release/`. To receive all localized strings, run `flutter gen-l10n`. If you'd like to get multiple apks by splitting them into different platforms (results in smaller sizes), use `flutter build apk --split-per-abi`.

# Packages used

The packages used for this app, also listed in the pubspec.yaml file. See their respective licenses.

Package | Use case
-|-
[camera](https://pub.dev/packages/camera) | Camera functionality
[device_info_plus](https://pub.dev/packages/device_info_plus) | Getting the Android version to adapt saving behaviour
[dynamic_color](https://pub.dev/packages/dynamic_color) | Getting the Android Material 3 dynamic color
[file_picker](https://pub.dev/packages/file_picker) | Picking the save path
[flutter](https://pub.dev/packages/flutter) | Flutter SDK
[flutter_android_volume_keydown](https://pub.dev/packages/flutter/flutter_android_volume_keydown) | Capture photo/video on volume button press
[flutter_image_compress](https://pub.dev/packages/flutter_image_compress) | Image compression and EXIF metadata removal
[flutter_localizations](https://pub.dev/packages/flutter_localizations) | Localization
[image](https://pub.dev/packages/image) | Ability to flip captured photos horizontally
[intl](https://pub.dev/packages/intl) | Localization
[native_device_orientation](https://pub.dev/packages/native_device_orientation) | Automatic orientation based on the phones sensor
[package_info_plus](https://pub.dev/packages/package_info_plus) | Display the programs version number
[permission_handler](https://pub.dev/packages/permission_handler) | Handling permissions
[provider](https://pub.dev/packages/provider) | State management (localization and themes)
[screen_brightness](https://pub.dev/packages/screen_brightness) | Maximum screen brightness option
[shared_preferences](https://pub.dev/packages/shared_preferences) | Saving app data like settings
[smooth_page_indicator](https://pub.dev/packages/smooth_page_indicator) | Page indicator in the onboarding screen
[url_launcher](https://pub.dev/packages/url_launcher) | Open the GitHub repository link inside the about menu
[video_thumbnail](https://pub.dev/packages/video_thumbnail) | Displaying a captured video inside the thumbnail
[wakelock](https://pub.dev/packages/wakelock) | Keeping the display always on

# License

This project is licensed under the [GNU General Public License Version 3](https://www.gnu.org/licenses/gpl-3.0.html). For details, see [LICENSE](LICENSE)
