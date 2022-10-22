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
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsButton extends StatelessWidget {
  const SettingsButton({
    Key? key,
    required this.controller,
    required this.onNewCameraSelected,
  }) : super(key: key);

  final CameraController? controller;
  final Function(CameraDescription) onNewCameraSelected;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        await Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SettingsPage(
              controller: controller,
              onNewCameraSelected: onNewCameraSelected,
            ),
          ),
        );
      },
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
  bool useAppInEnglish = true;
  bool alwaysStartWithRearCamera = true;
  bool flipFrontCameraPhotos = true;
  FlashMode? flashMode = FlashMode.off;
  bool saveEXIFData = false;
  String currentSavePath = Preferences.getSavePath();
  bool isMoreOptions = false;

  ScrollController listScrollController = ScrollController();

  //CompressQuality Slider
  double value = Preferences.getCompressQuality().toDouble();

  TextStyle style = const TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
  );

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (() async {
        await widget.onNewCameraSelected(widget.controller!.description);
        return true;
        //return true;
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
            _enableModeRow(),
            const Divider(),
            _enableZoomSliderTile(),
            const Divider(),
            _enableExposureSliderTile(),
            const Divider(),
            _headingTile(AppLocalizations.of(context)!.cameraBehaviour),
            _resolutionTile(),
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
            isMoreOptions ? _moreTile() : Container()
          ],
        ),
      ),
    );
  }

  Widget _moreTile() {
    return Padding(
      padding: const EdgeInsets.only(left: 32.0),
      child: Column(
        children: [
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

  Widget _aboutTile() {
    void launchGitHubURL() async {
      var url = Uri.parse('https://github.com/iakmds/librecamera');
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.externalApplication);
      } else {
        throw 'Could not launch $url';
      }
    }

    return AboutListTile(
      icon: const Icon(Icons.info),
      applicationName: 'Libre Camera',
      applicationVersion: AppLocalizations.of(context)!.version(
          '1.1.0'), //TODO change versions HERE AND pubspec.yaml at 'version'
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

  Widget _onboardingScreenTile() {
    return ListTile(
      title: Text(AppLocalizations.of(context)!.onboardingScreen),
      subtitle: Text(
        AppLocalizations.of(context)!.onboardingScreen_description,
      ),
      trailing: IconButton(
        color: Colors.white,
        onPressed: () async {
          Preferences.setOnBoardingComplete(false);

          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const OnboardingPage()),
          );
        },
        iconSize: 35,
        icon: const Icon(
          Icons.logout,
          color: Colors.blue,
        ),
      ),
    );
  }

  Widget _captureOrientationLockedTile() {
    return SwitchListTile(
      title: Text(AppLocalizations.of(context)!.lockCaptureOrientation),
      subtitle: Text(
          AppLocalizations.of(context)!.lockCaptureOrientation_description),
      value: Preferences.getIsCaptureOrientationLocked(),
      onChanged: (value) {
        setState(() {
          Preferences.setIsCaptureOrientationLocked(value);
        });
      },
    );
  }

  Widget _showNavigationBarTile() {
    return SwitchListTile(
      title: Text(AppLocalizations.of(context)!.showNavigationBar),
      subtitle:
          Text(AppLocalizations.of(context)!.showNavigationBar_description),
      value: Preferences.getShowNavigationBar(),
      onChanged: (value) {
        setState(() {
          Preferences.setShowNavigationBar(value);
        });
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

            setState(() {
              currentSavePath = Preferences.getSavePath();
            });
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
      onChanged: (value) {
        setState(() {
          Preferences.setKeepEXIFMetadata(value);
        });
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
                    onChanged: (value) {
                      setState(() {
                        this.value = value;
                      });
                    },
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

  Widget _disableAudioTile() {
    return SwitchListTile(
      title: Text(AppLocalizations.of(context)!.disableAudio),
      subtitle: Text(AppLocalizations.of(context)!.disableAudio_description),
      value: !Preferences.getEnableAudio(),
      onChanged: (value) {
        setState(() {
          Preferences.setEnableAudio(!value);
        });
      },
    );
  }

  Widget _enableModeRow() {
    return SwitchListTile(
      title: Text(AppLocalizations.of(context)!.enableModeRow),
      subtitle: Text(AppLocalizations.of(context)!.enableModeRow_description),
      value: Preferences.getEnableModeRow(),
      onChanged: (value) {
        setState(() {
          Preferences.setEnableModeRow(value);
        });
      },
    );
  }

  Widget _startWithFrontCameraTile() {
    return SwitchListTile(
      title: Text(AppLocalizations.of(context)!.startWithFrontCamera),
      subtitle:
          Text(AppLocalizations.of(context)!.startWithFrontCamera_description),
      value: !Preferences.getStartWithRearCamera(),
      onChanged: (value) {
        setState(() {
          Preferences.setStartWithRearCamera(!value);
        });
      },
    );
  }

  Widget _flipPhotosFrontCameraTile() {
    return SwitchListTile(
      title: Text(AppLocalizations.of(context)!.flipPhotosFrontCamera),
      subtitle:
          Text(AppLocalizations.of(context)!.flipPhotosFrontCamera_description),
      value: !Preferences.getFlipFrontCameraPhoto(),
      onChanged: (value) {
        setState(() {
          Preferences.setFlipFrontCameraPhoto(!value);
        });
      },
    );
  }

  Widget _resolutionTile() {
    return ListTile(
      title: Text(AppLocalizations.of(context)!.resolution),
      subtitle: Text(AppLocalizations.of(context)!.resolution_description),
      trailing: const ResolutionButton(),
    );
  }

  Widget _enableExposureSliderTile() {
    return SwitchListTile(
      title: Text(AppLocalizations.of(context)!.enableExposureSlider),
      subtitle:
          Text(AppLocalizations.of(context)!.enableExposureSlider_description),
      value: Preferences.getEnableExposureSlider(),
      onChanged: (value) {
        setState(() {
          Preferences.setEnableExposureSlider(value);
        });
      },
    );
  }

  Widget _enableZoomSliderTile() {
    return SwitchListTile(
      title: Text(AppLocalizations.of(context)!.enableZoomSlider),
      subtitle:
          Text(AppLocalizations.of(context)!.enableZoomSlider_description),
      value: Preferences.getEnableZoomSlider(),
      onChanged: (value) {
        setState(() {
          Preferences.setEnableZoomSlider(value);
        });
      },
    );
  }

  Widget _themeTile() {
    return ListTile(
      title: Text(AppLocalizations.of(context)!.theme),
      subtitle: Text(AppLocalizations.of(context)!.theme_description),
      trailing: DropdownButton(
        icon: Preferences.getThemeMode() == ThemeMode.system.name
            ? const Icon(Icons.settings_display)
            : Preferences.getThemeMode() == ThemeMode.light.name
                ? const Icon(Icons.light_mode)
                : const Icon(Icons.dark_mode),
        value: Themes.getThemeModeFromName(Preferences.getThemeMode()),
        items: [
          DropdownMenuItem(
            value: ThemeMode.system,
            onTap: () {
              final provider =
                  Provider.of<ThemeProvider>(context, listen: false);

              provider.setTheme(ThemeMode.system);
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text(AppLocalizations.of(context)!.themeSystem),
            ),
          ),
          DropdownMenuItem(
            value: ThemeMode.light,
            onTap: () {
              final provider =
                  Provider.of<ThemeProvider>(context, listen: false);

              provider.setTheme(ThemeMode.light);
            },
            child: Text(AppLocalizations.of(context)!.themeLight),
          ),
          DropdownMenuItem(
            value: ThemeMode.dark,
            onTap: () {
              final provider =
                  Provider.of<ThemeProvider>(context, listen: false);

              provider.setTheme(ThemeMode.dark);
            },
            child: Text(AppLocalizations.of(context)!.themeDark),
          ),
        ],
        onChanged: (_) {},
      ),
    );
  }

  Widget _languageTile() {
    return ListTile(
      title: Text(AppLocalizations.of(context)!.language),
      subtitle: Text(AppLocalizations.of(context)!.language_description),
      trailing: DropdownButton(
        icon: const Icon(Icons.language),
        value: Preferences.getLanguage().isNotEmpty
            ? Locale(Preferences.getLanguage())
            : null,
        items: Localization.supportedLocales.map(
          (locale) {
            //TODO add support  for country codes
            final name = Localization.getName(locale.languageCode);

            return DropdownMenuItem(
              value: locale,
              onTap: () {
                final provider =
                    Provider.of<LocaleProvider>(context, listen: false);

                provider.setLocale(locale);
              },
              child: Text(name),
            );
          },
        ).toList()
          ..insert(
            0,
            DropdownMenuItem<Locale>(
              value: null,
              onTap: () {
                final provider =
                    Provider.of<LocaleProvider>(context, listen: false);

                provider.clearLocale();
              },
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
}
