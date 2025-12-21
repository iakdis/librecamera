import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:librecamera/src/pages/camera_page.dart';
import 'package:librecamera/src/utils/preferences.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../l10n/app_localizations.dart';
import '../app.dart';
import '../provider/theme_provider.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final controller = PageController();
  bool isLastPage = false;
  bool cameraPermissionGranted = false;
  bool microphonePermissionGranted = false;
  bool storagePermissionGranted = false;
  String currentSavePath = Preferences.getSavePath();
  int currentPage = 0;
  TextEditingController textController = TextEditingController();
  late FocusNode focusNode;

  @override
  void initState() {
    textController.text = currentSavePath;
    textController.addListener(() {
      currentSavePath = textController.text;
      Preferences.setSavePath(currentSavePath);
    });
    textController.selection = TextSelection(
      baseOffset: textController.text.length,
      extentOffset: textController.text.length,
    );
    focusNode = FocusNode();
    super.initState();
  }

  bool checkPermissions() {
    return cameraPermissionGranted;
  }

  void cameraPermission() async {
    await Permission.camera.request();
    var status = await Permission.camera.status;

    if (status.isGranted) {
      if (kDebugMode) {
        print('Camera Permission: GRANTED');
      }
      setState(() {
        cameraPermissionGranted = true;
      });
    } else {
      if (kDebugMode) {
        print('Camera Permission: DENIED');
      }
    }
  }

  void storagePermission() async {
    await Permission.storage.request();
    var status = await Permission.storage.status;

    if (status.isGranted) {
      if (kDebugMode) {
        print('Storage Permission: GRANTED');
      }
      setState(() {
        storagePermissionGranted = true;
      });
    } else {
      if (kDebugMode) {
        print('Storage: DENIED');
      }
    }
  }

  void savePath() async {
    String? selectedDirectory = await FilePicker.platform.getDirectoryPath();

    if (selectedDirectory == null) {
      // User canceled the picker
    }

    Preferences.setSavePath(selectedDirectory ?? Preferences.getSavePath());

    setState(() {
      currentSavePath = Preferences.getSavePath();
      textController.text = currentSavePath;
      textController.selection = TextSelection(
        baseOffset: textController.text.length,
        extentOffset: textController.text.length,
      );
    });
  }

  void previousPage() {
    focusNode.unfocus();
    controller.previousPage(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
    unfocusAndRestore();
  }

  void nextPage() {
    focusNode.unfocus();
    controller.nextPage(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
    unfocusAndRestore();
  }

  bool nextEnabled() {
    if (currentPage == 0) {
      if (checkPermissions()) {
        return true;
      }
    } else if (currentPage == 1) {
      if (currentSavePath.isNotEmpty) {
        return true;
      }
    } else if (currentPage == 2) {
      return true;
    }

    return false;
  }

  @override
  void dispose() {
    controller.dispose();
    textController.dispose();
    super.dispose();
  }

  Widget _permissionsPage() {
    return Container(
      color: Colors.orange.shade100,
      child: MediaQuery.of(context).orientation == Orientation.portrait
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [_permissionsPageInfo(), _permissionsPageButtons()],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: _permissionsPageInfo()),
                Expanded(child: _permissionsPageButtons()),
              ],
            ),
    );
  }

  Widget _permissionsPageInfo() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppLocalizations.of(context)!.permissionsTitle,
          style: TextStyle(
            color: Colors.teal.shade700,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 24.0),
        MediaQuery.of(context).orientation == Orientation.portrait
            ? const Icon(Icons.settings, size: 100, color: Colors.white)
            : Container(),
        MediaQuery.of(context).orientation == Orientation.portrait
            ? const SizedBox(height: 24.0)
            : Container(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 64.0),
          child: Text(
            AppLocalizations.of(context)!.permissionsTitle_description,
            style: TextStyle(
              color: Colors.teal.shade700,
              fontSize: 17.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  Widget _permissionsPageButtons() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 24.0),
        ElevatedButton(
          onPressed: cameraPermissionGranted ? null : cameraPermission,
          child: Text(AppLocalizations.of(context)!.giveCameraPermission),
        ),
        const SizedBox(height: 16.0),
        ElevatedButton(
          onPressed: storagePermissionGranted ? null : storagePermission,
          child: Text(AppLocalizations.of(context)!.giveStoragePermission),
        ),
      ],
    );
  }

  Widget _savePathPage() {
    return Container(
      color: Colors.blue.shade100,
      child: MediaQuery.of(context).orientation == Orientation.portrait
          ? SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 64.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [_savePathPageInfo(), _savePathPageButtons()],
              ),
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: _savePathPageInfo()),
                Expanded(child: _savePathPageButtons()),
              ],
            ),
    );
  }

  Widget _savePathPageInfo() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppLocalizations.of(context)!.savePathTitle,
          style: TextStyle(
            color: Colors.teal.shade700,
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 24.0),
        MediaQuery.of(context).orientation == Orientation.portrait
            ? const Icon(Icons.save_as, size: 100, color: Colors.white)
            : Container(),
        MediaQuery.of(context).orientation == Orientation.portrait
            ? const SizedBox(height: 24.0)
            : Container(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 64.0),
          child: Text(
            AppLocalizations.of(context)!.savePathTitle_description,
            style: TextStyle(
              color: Colors.teal.shade700,
              fontSize: 17.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  Widget _savePathPageButtons() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 24.0),
        ElevatedButton(
          onPressed: savePath,
          child: Text(AppLocalizations.of(context)!.choosePath),
        ),
        const SizedBox(height: 48.0),
        SizedBox(
          width: 256,
          child: TextField(
            controller: textController,
            focusNode: focusNode,
            onSubmitted: (value) {
              currentSavePath = value;
              Preferences.setSavePath(currentSavePath);
              focusNode.unfocus();
              SystemChrome.restoreSystemUIOverlays();
            },
            style: TextStyle(color: Colors.grey[600], fontSize: 17.0),
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: AppLocalizations.of(context)!.savePath,
              isDense: true,
              hintText: 'storage/emulated/0/DCIM',
              hintStyle: TextStyle(
                color: Colors.grey[500],
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _welcomePageInfo() {
    return Container(
      color: Colors.green.shade100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppLocalizations.of(context)!.welcomeTitle,
            style: TextStyle(
              color: Colors.teal.shade700,
              fontSize: 36.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24.0),
          MediaQuery.of(context).orientation == Orientation.portrait
              ? const Icon(Icons.handshake, size: 100, color: Colors.white)
              : Container(),
          MediaQuery.of(context).orientation == Orientation.portrait
              ? const SizedBox(height: 24.0)
              : Container(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 64.0),
            child: Text(
              AppLocalizations.of(context)!.welcomeTitle_description,
              style: TextStyle(
                color: Colors.teal.shade700,
                fontSize: 17.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _welcomePageBottomButton() {
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        backgroundColor: Colors.teal.shade700,
        minimumSize: const Size.fromHeight(80.0),
      ),
      child: Text(
        AppLocalizations.of(context)!.getStarted,
        style: const TextStyle(fontSize: 24.0),
      ),
      onPressed: () {
        Preferences.setOnBoardingComplete(true);

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const CameraPage()),
        );
      },
    );
  }

  Widget _bottomPageIndicator() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      height: 80.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: previousPage,
            child: Text(AppLocalizations.of(context)!.back.toUpperCase()),
          ),
          Center(
            child: SmoothPageIndicator(
              controller: controller,
              count: 3,
              effect: WormEffect(
                spacing: 16.0,
                dotColor: Colors.black26,
                activeDotColor: Colors.teal.shade700,
              ),
            ),
          ),
          TextButton(
            onPressed: nextEnabled() ? nextPage : null,
            child: Text(AppLocalizations.of(context)!.next.toUpperCase()),
          ),
        ],
      ),
    );
  }

  void unfocusAndRestore() {
    FocusScopeNode currentFocus = FocusScope.of(context);

    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
      SystemChrome.restoreSystemUIOverlays();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) => unfocusAndRestore(),
      child: Theme(
        data: context.watch<ThemeProvider>().theme(
          colorScheme: ColorScheme.fromSeed(seedColor: defaultThemeColour),
        ),
        child: Scaffold(
          body: Container(
            padding: const EdgeInsets.only(bottom: 80.0),
            child: PageView(
              physics: nextEnabled()
                  ? const ScrollPhysics()
                  : const NeverScrollableScrollPhysics(),
              controller: controller,
              onPageChanged: (index) {
                setState(() {
                  isLastPage = index == 2;
                  currentPage = index;

                  unfocusAndRestore();
                });
              },
              children: [
                _permissionsPage(),
                _savePathPage(),
                _welcomePageInfo(),
              ],
            ),
          ),
          bottomSheet: isLastPage
              ? _welcomePageBottomButton()
              : _bottomPageIndicator(),
        ),
      ),
    );
  }
}
