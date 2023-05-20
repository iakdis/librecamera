import 'package:camera/camera.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:librecamera/l10n/l10n.dart';
import 'package:librecamera/src/pages/onboarding_page.dart';
import 'package:librecamera/src/provider/locale_provider.dart';
import 'package:librecamera/src/provider/theme_provider.dart';
import 'package:librecamera/src/utils/preferences.dart';
import 'package:librecamera/src/widgets/format.dart';
import 'package:librecamera/src/widgets/resolution.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:screen_brightness/screen_brightness.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({
    Key? key,
    required this.onPressed,
    required this.controller,
  }) : super(key: key);

  final void Function()? onPressed;
  final CameraController? controller;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      disabledColor: Colors.white24,
      onPressed: onPressed,
      icon: const Icon(Icons.settings),
      tooltip: AppLocalizations.of(context)!.settings,
      iconSize: 35,
      color: Colors.white,
    );
  }
}

class SettingsPage extends StatefulWidget {
  const SettingsPage({
    Key? key,
    required this.controller,
    required this.onNewCameraSelected,
  }) : super(key: key);

  final CameraController? controller;
  final Function(CameraDescription) onNewCameraSelected;

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String currentSavePath = Preferences.getSavePath();
  bool isMoreOptions = false;

  ScrollController listScrollController = ScrollController();

  //Compress quality slider
  double value = Preferences.getCompressQuality().toDouble();

  TextStyle style = const TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
  );

  Widget _moreTile() {
    return Padding(
      padding: const EdgeInsets.only(left: 32.0),
      child: Column(
        children: [
          _useMaterial3Tile(),
          const Divider(),
          _captureOrientationLockedTile(),
          const Divider(),
          _showNavigationBarTile(),
          const Divider(),
          _onboardingScreenTile(),
          const Divider(),
          _aboutTile(),
        ],
      ),
    );
  }

  Widget _headingTile(String text) {
    return ListTile(
      title: Text(
        text,
        style: style,
      ),
    );
  }

  Widget _aboutListTile({String? version}) {
    void launchGitHubURL() async {
      var url = Uri.parse('https://github.com/iakmds/librecamera');
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      }
    }

    return AboutListTile(
      icon: const Icon(Icons.info),
      applicationName: 'Libre Camera',
      applicationVersion: version != null
          ? AppLocalizations.of(context)!.version(version)
          : null,
      applicationIcon: const Image(
        image: AssetImage('assets/images/icon.png'),
        width: 50,
        height: 50,
      ),
      applicationLegalese: 'GNU Public License v3',
      aboutBoxChildren: [
        Text(AppLocalizations.of(context)!.license),
        const Divider(),
        TextButton.icon(
          icon: const Icon(Icons.open_in_new),
          onPressed: launchGitHubURL,
          label: SelectableText(
            'https://github.com/iakmds/librecamera',
            style: const TextStyle(
              color: Colors.blue,
            ),
            onTap: launchGitHubURL,
          ),
        ),
      ],
    );
  }

  Widget _aboutTile() {
    return FutureBuilder(
      future: PackageInfo.fromPlatform(),
      builder: (context, snapshot) {
        return _aboutListTile(
            version: snapshot.hasData
                ? (snapshot.data! as PackageInfo).version
                : null);
      },
    );
  }

  Widget _onboardingScreenTile() {
    return ListTile(
      title: Text(AppLocalizations.of(context)!.onboardingScreen),
      subtitle: Text(
        AppLocalizations.of(context)!.onboardingScreen_description,
      ),
      trailing: const Icon(Icons.logout),
      onTap: () async {
        Preferences.setOnBoardingComplete(false);

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const OnboardingPage()),
        );
      },
    );
  }

  Widget _captureOrientationLockedTile() {
    return SwitchListTile(
      title: Text(AppLocalizations.of(context)!.lockCaptureOrientation),
      subtitle: Text(
          AppLocalizations.of(context)!.lockCaptureOrientation_description),
      value: Preferences.getIsCaptureOrientationLocked(),
      onChanged: (value) async {
        Preferences.setIsCaptureOrientationLocked(value);
        setState(() {});
      },
    );
  }

  Widget _showNavigationBarTile() {
    return SwitchListTile(
      title: Text(AppLocalizations.of(context)!.showNavigationBar),
      subtitle:
          Text(AppLocalizations.of(context)!.showNavigationBar_description),
      value: Preferences.getShowNavigationBar(),
      onChanged: (value) async {
        await Preferences.setShowNavigationBar(value);
        setState(() {});
      },
    );
  }

  Widget _showMoreTile() {
    return InkWell(
      onTap: () => setState(() {
        isMoreOptions = !isMoreOptions;

        SchedulerBinding.instance.addPostFrameCallback((_) {
          listScrollController.animateTo(
            listScrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
          );
        });
      }),
      child: ListTile(
        title: Text(
          isMoreOptions
              ? AppLocalizations.of(context)!.less
              : AppLocalizations.of(context)!.more,
          style: style,
        ),
        trailing: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            isMoreOptions ? Icons.expand_less : Icons.expand_more,
            size: 35,
          ),
        ),
      ),
    );
  }

  Widget _savePathTile() {
    return ListTile(
      title: Text(AppLocalizations.of(context)!.savePath),
      subtitle: Text(
        AppLocalizations.of(context)!.savePath_description(currentSavePath),
      ),
      trailing: ElevatedButton(
          onPressed: () async {
            String? selectedDirectory =
                await FilePicker.platform.getDirectoryPath();

            if (selectedDirectory == null) {
              // User canceled the picker
            }

            Preferences.setSavePath(
                selectedDirectory ?? Preferences.getSavePath());

            currentSavePath = Preferences.getSavePath();
            setState(() {});
          },
          child: Text(AppLocalizations.of(context)!.choosePath)),
    );
  }

  Widget _keepEXIFMetadataTile() {
    return SwitchListTile(
      title: Text(AppLocalizations.of(context)!.keepEXIFMetadata),
      subtitle:
          Text(AppLocalizations.of(context)!.keepEXIFMetadata_description),
      value: Preferences.getKeepEXIFMetadata(),
      onChanged: (value) async {
        await Preferences.setKeepEXIFMetadata(value);
        setState(() {});
      },
    );
  }

  Widget _imageCompressionFormat() {
    return ListTile(
      title: Text(AppLocalizations.of(context)!.format),
      subtitle: Text(AppLocalizations.of(context)!.format_description),
      trailing: const FormatButton(),
    );
  }

  Widget _imageCompressionTile() {
    return ListTile(
      title: Text(AppLocalizations.of(context)!.imageCompressionQuality),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppLocalizations.of(context)!
              .imageCompressionQuality_description),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
            child: Row(
              children: [
                const Text('10', style: TextStyle(fontWeight: FontWeight.bold)),
                Flexible(
                  child: Slider(
                    value: value,
                    onChanged: (value) => setState(() => this.value = value),
                    onChangeEnd: (value) {
                      Preferences.setCompressQuality(value.toInt());
                    },
                    min: 10,
                    max: 100,
                    label: value.round().toString(),
                    //label: Preferences.getCompressQuality().round().toString(),
                    divisions: 90,
                  ),
                ),
                const Text('100',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _disableShutterSoundTile() {
    return SwitchListTile(
      title: Text(AppLocalizations.of(context)!.shutterSound),
      subtitle: Text(AppLocalizations.of(context)!.shutterSound_description),
      value: Preferences.getDisableShutterSound(),
      onChanged: (value) async {
        await Preferences.setDisableShutterSound(value);
        setState(() {});
      },
    );
  }

  Widget _captureAtVolumePressTile() {
    return SwitchListTile(
      title: Text(AppLocalizations.of(context)!.captureAtVolumePress),
      subtitle:
          Text(AppLocalizations.of(context)!.captureAtVolumePress_description),
      value: Preferences.getCaptureAtVolumePress(),
      onChanged: (value) async {
        await Preferences.setCaptureAtVolumePress(value);
        setState(() {});
      },
    );
  }

  Widget _disableAudioTile() {
    return SwitchListTile(
      title: Text(AppLocalizations.of(context)!.disableAudio),
      subtitle: Text(AppLocalizations.of(context)!.disableAudio_description),
      value: !Preferences.getEnableAudio(),
      onChanged: (value) async {
        await Preferences.setEnableAudio(!value);
        setState(() {});
      },
    );
  }

  Widget _enableModeRow() {
    return SwitchListTile(
      title: Text(AppLocalizations.of(context)!.enableModeRow),
      subtitle: Text(AppLocalizations.of(context)!.enableModeRow_description),
      value: Preferences.getEnableModeRow(),
      onChanged: (value) async {
        await Preferences.setEnableModeRow(value);
        setState(() {});
      },
    );
  }

  Widget _startWithFrontCameraTile() {
    return SwitchListTile(
      title: Text(AppLocalizations.of(context)!.startWithFrontCamera),
      subtitle:
          Text(AppLocalizations.of(context)!.startWithFrontCamera_description),
      value: !Preferences.getStartWithRearCamera(),
      onChanged: (value) async {
        await Preferences.setStartWithRearCamera(!value);
        setState(() {});
      },
    );
  }

  Widget _flipPhotosFrontCameraTile() {
    return SwitchListTile(
      title: Text(AppLocalizations.of(context)!.flipPhotosFrontCamera),
      subtitle:
          Text(AppLocalizations.of(context)!.flipPhotosFrontCamera_description),
      value: !Preferences.getFlipFrontCameraPhoto(),
      onChanged: (value) async {
        await Preferences.setFlipFrontCameraPhoto(!value);
        setState(() {});
      },
    );
  }

  Widget _resolutionTile() {
    return ListTile(
      title: Text(AppLocalizations.of(context)!.resolution),
      subtitle: Text(AppLocalizations.of(context)!.resolution_description),
      trailing: const ResolutionButton(enabled: true),
    );
  }

  Widget _enableExposureSliderTile() {
    return SwitchListTile(
      title: Text(AppLocalizations.of(context)!.enableExposureSlider),
      subtitle:
          Text(AppLocalizations.of(context)!.enableExposureSlider_description),
      value: Preferences.getEnableExposureSlider(),
      onChanged: (value) async {
        await Preferences.setEnableExposureSlider(value);
        setState(() {});
      },
    );
  }

  Widget _enableZoomSliderTile() {
    return SwitchListTile(
      title: Text(AppLocalizations.of(context)!.enableZoomSlider),
      subtitle:
          Text(AppLocalizations.of(context)!.enableZoomSlider_description),
      value: Preferences.getEnableZoomSlider(),
      onChanged: (value) async {
        await Preferences.setEnableZoomSlider(value);
        setState(() {});
      },
    );
  }

  Widget _themeTile() {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);

    return ListTile(
      title: Text(AppLocalizations.of(context)!.theme),
      subtitle: Text(AppLocalizations.of(context)!.theme_description),
      trailing: DropdownButton(
        icon: Preferences.getThemeMode() == CustomThemeMode.system.name
            ? const Icon(Icons.settings_display)
            : Preferences.getThemeMode() == CustomThemeMode.light.name
                ? const Icon(Icons.light_mode)
                : const Icon(Icons.dark_mode),
        value: CustomThemeMode.values.byName(Preferences.getThemeMode()),
        items: [
          DropdownMenuItem(
            value: CustomThemeMode.system,
            onTap: () => themeProvider.setTheme(CustomThemeMode.system),
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text(AppLocalizations.of(context)!.themeSystem),
            ),
          ),
          DropdownMenuItem(
            value: CustomThemeMode.light,
            onTap: () => themeProvider.setTheme(CustomThemeMode.light),
            child: Text(AppLocalizations.of(context)!.themeLight),
          ),
          DropdownMenuItem(
            value: CustomThemeMode.dark,
            onTap: () => themeProvider.setTheme(CustomThemeMode.dark),
            child: Text(AppLocalizations.of(context)!.themeDark),
          ),
          DropdownMenuItem(
            value: CustomThemeMode.black,
            onTap: () => themeProvider.setTheme(CustomThemeMode.black),
            child: Text(AppLocalizations.of(context)!.themeBlack),
          ),
        ],
        onChanged: (_) {},
      ),
    );
  }

  Widget _maximumScreenBrightnessTile() {
    return SwitchListTile(
      title: Text(AppLocalizations.of(context)!.enableMaximumScreenBrightness),
      subtitle: Text(AppLocalizations.of(context)!
          .enableMaximumScreenBrightness_description),
      value: Preferences.getMaximumScreenBrightness(),
      onChanged: (value) async {
        await Preferences.setMaximumScreenBrightness(value);
        Preferences.getMaximumScreenBrightness()
            ? await ScreenBrightness().setScreenBrightness(1.0)
            : await ScreenBrightness().resetScreenBrightness();
        setState(() {});
      },
    );
  }

  Widget _leftHandedModeTile() {
    return SwitchListTile(
      title: Text(AppLocalizations.of(context)!.leftHandedMode),
      subtitle: Text(AppLocalizations.of(context)!.leftHandedMode_description),
      value: Preferences.getLeftHandedMode(),
      onChanged: (value) async {
        await Preferences.setLeftHandedMode(value);
        setState(() {});
      },
    );
  }

  Widget _languageTile() {
    final localeProvider = Provider.of<LocaleProvider>(context, listen: false);

    return ListTile(
      title: Text(AppLocalizations.of(context)!.language),
      subtitle: Text(AppLocalizations.of(context)!.language_description),
      trailing: DropdownButton<String>(
        icon: const Icon(Icons.language),
        value: Preferences.getLanguage().isNotEmpty
            ? Preferences.getLanguage()
            : null,
        items: Localization.supportedLocales.map(
          (locale) {
            final name = Localization.getName(locale);

            return DropdownMenuItem(
              value: locale.toLanguageTag(),
              onTap: () => localeProvider.setLocale(locale),
              child: Text(name),
            );
          },
        ).toList()
          ..insert(
            0,
            DropdownMenuItem<String>(
              value: null,
              onTap: () => localeProvider.clearLocale(),
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text(AppLocalizations.of(context)!.systemLanguage),
              ),
            ),
          ),
        onChanged: (_) {},
      ),
    );
  }

  Widget _useMaterial3Tile() {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);

    return SwitchListTile(
      title: Text(AppLocalizations.of(context)!.useMaterialYou),
      subtitle: Text(AppLocalizations.of(context)!.useMaterialYou_description),
      value: Preferences.getUseMaterial3(),
      onChanged: (value) {
        Preferences.setUseMaterial3(value);
        themeProvider.setTheme(themeProvider.themeMode());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (() async {
        await widget.onNewCameraSelected(widget.controller!.description);
        return true;
      }),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: (() async {
              await widget.onNewCameraSelected(widget.controller!.description);
              if (!mounted) return;
              Navigator.pop(context);
            }),
            tooltip: AppLocalizations.of(context)!.back,
          ),
          title: Text(AppLocalizations.of(context)!.settings),
        ),
        body: ListView(
          controller: listScrollController,
          padding: const EdgeInsets.fromLTRB(0, 8.0, 0, 8.0),
          children: <Widget>[
            _headingTile(AppLocalizations.of(context)!.appSettings),
            _languageTile(),
            const Divider(),
            _themeTile(),
            const Divider(),
            _maximumScreenBrightnessTile(),
            const Divider(),
            _leftHandedModeTile(),
            const Divider(),
            _enableModeRow(),
            const Divider(),
            _enableZoomSliderTile(),
            const Divider(),
            _enableExposureSliderTile(),
            const Divider(),
            _headingTile(AppLocalizations.of(context)!.cameraBehaviour),
            _resolutionTile(),
            const Divider(),
            _captureAtVolumePressTile(),
            const Divider(),
            _disableShutterSoundTile(),
            const Divider(),
            _startWithFrontCameraTile(),
            const Divider(),
            _disableAudioTile(),
            const Divider(),
            _headingTile(AppLocalizations.of(context)!.saving),
            _flipPhotosFrontCameraTile(),
            const Divider(),
            _imageCompressionFormat(),
            const Divider(),
            _imageCompressionTile(),
            const Divider(),
            _keepEXIFMetadataTile(),
            const Divider(),
            _savePathTile(),
            const Divider(),
            _showMoreTile(),
            if (isMoreOptions) _moreTile(),
          ],
        ),
      ),
    );
  }
}
