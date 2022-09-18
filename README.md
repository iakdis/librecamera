# Libre Camera
A free and open source camera app for Android written in Flutter and Dart licensed under the [GPLv3](LICENSE)

<img src="https://github.com/iakmds/librecamera/blob/master/.github/icon/icon.png" alt="Libre Camera app icon" height="128">

## Screenshots
<p float="left">
  <img src="https://github.com/iakmds/librecamera/blob/master/.github/screenshots/screenshot01.png" alt="Screenshot 1" height="420">
  <img src="https://github.com/iakmds/librecamera/blob/master/.github/screenshots/screenshot02.png" alt="Screenshot 2" height="420">
  <img src="https://github.com/iakmds/librecamera/blob/master/.github/screenshots/screenshot03.png" alt="Screenshot 3" height="420">
  <img src="https://github.com/iakmds/librecamera/blob/master/.github/screenshots/screenshot04.png" alt="Screenshot 4" height="420">
</p>

# Download

For now, download and install the apk directly in the GitHub [releases](https://github.com/iakmds/librecamera/releases) page


# Features

- Take pictures and record videos with your rear and front camera
- Privacy: No EXIF Metadata saved by default when taking pictures (enable optionally in settings)
- Themes: Material Design with a Dark, Light or system theme
- Languages currently supported: English, German – [Contribute translating your language!](#contributing)
- Zoom: Zoom with 2 fingers or with an optional slider
- Flashlight modes: On at capture, Off, Auto, Always on
- Focus: Auto focus, locked focus and manual focus by touching the screen
- Exposure: Auto exposure, locked exposure and manual exposure with an optional slider
- Image compression: Set the compression amount in the settings
- Resolutions: Switch between different camera resolutions
- Save location: Choose your preferred save location
- Small size (~8 MB)
- Customizable: Open the settings to customize the app to your liking!

# Roadmap

- [ ] More supported languages (See #contributing below)
- [ ] Feature: Add photo capture delay option
- [ ] New theme: Black Dark mode for AMOLED screens
- [ ] Check tablet support
- [ ] [Your feature](https://github.com/iakmds/librecamera/issues)

# Contributing

- **Translate**

Currently supported languages: English, German

*Get started:*

1. If not already supported (see above), request a new language by [opening an issue](https://github.com/iakmds/librecamera/issues) on GitHub and I will add the necessary code for the second step
2. Translate an already existing language (see below)

Translating guide: Go to the .arb file of the language you want to translate (for example, [this](https://github.com/iakmds/librecamera/blob/master/assets/l10n/app_de.arb) file for German) and change the text inside the "" quotation marks.

Additionally, if you want to translate the local app name (default: "Camera"), go to the strings.xml file of the language you want to translate (for example, [this](https://github.com/iakmds/librecamera/blob/master/android/app/src/main/res/values-de/styles.xml) file for German and translate the "Camera" text inside ```<string name="AppName">Camera</string>```

- **Bug Reporting or a Feature Request**

Open an issue on GitHub: [Open issue](https://github.com/iakmds/librecamera/issues)

- **Code**

Feel free to send in a [Pull Request](https://github.com/iakmds/librecamera/pulls)! To get started with Flutter, follow this link: [https://docs.flutter.dev/get-started/install](https://docs.flutter.dev/get-started/install)

1. Clone this repository
2. Switch to the project's directory and run the project in debug mode by selecting an Android device or emulator in your preferred Flutter IDE and running the app in debug mode
3. To test the final app, run the app by installing the apk on an Android device or emulator. To get the apk, run the following command in your terminal: ```flutter build apk --split-per-abi``` – the output apk's will be generated at ```librecamera/build/app/outputs/apk/release/```

# Packages used

The packages used for this app, also listed in the pubspec.yaml file. See their respective licenses.

- [android_intent_plus](https://pub.dev/packages/android_intent_plus): Used for opening photos and videos by clicking on the thumbnail
- [camera](https://pub.dev/packages/camera): Used for camera functionality
- [file_picker](https://pub.dev/packages/file_picker): Used for picking the save path
- [flutter](https://pub.dev/packages/flutter): Used for Flutter SDK
- [flutter_image_compress](https://pub.dev/packages/flutter_image_compress): Used for image compression and EXIF metadata removal
- [flutter_localizations](https://pub.dev/packages/flutter_localizations): Used for localization
- [image](https://pub.dev/packages/image): Used for the ability to flip captured photos horizontally
- [intl](https://pub.dev/packages/intl): Used for localization
- [path](https://pub.dev/packages/path): Used for looking up files and directories
- [permission_handler](https://pub.dev/packages/permission_handler): Used for handling permissions
- [provider](https://pub.dev/packages/provider): Used for state management, specifically localization and theme support
- [shared_preferences](https://pub.dev/packages/shared_preferences): Used for saving app data, including settings
- [smooth_page_indicator](https://pub.dev/packages/smooth_page_indicator): Used for the page indicator in the onboarding screen
- [video_player](https://pub.dev/packages/video_player): Used for displaying a captured video inside the thumbnail

# License

This project is licensed under the [GNU General Public License Version 3](https://www.gnu.org/licenses/gpl-3.0.html). For details, see [LICENSE](LICENSE)
