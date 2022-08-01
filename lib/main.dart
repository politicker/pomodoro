import 'dart:io';

// import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pomodoro/components/progress_bar.dart';
import 'package:provider/provider.dart';
import 'package:system_tray/system_tray.dart';
import 'package:window_manager/window_manager.dart';

import 'models/app_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Must add this line.
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
    size: Size(700, 300),
    center: true,
    backgroundColor: Colors.transparent,
    skipTaskbar: true,
    titleBarStyle: TitleBarStyle.hidden,
  );

  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.setSkipTaskbar(true);
    await windowManager.setAlwaysOnTop(true);
    await windowManager.show();
    await windowManager.focus();
  });

  runApp(
    ChangeNotifierProvider(
        create: (context) => AppModel(), child: const MyApp()),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final SystemTray systemTray = SystemTray();
  bool windowOpen = false;

  @override
  void initState() {
    super.initState();
    initSystemTray();
  }

  Future<void> initSystemTray() async {
    if (!(Platform.isMacOS || Platform.isLinux || Platform.isWindows)) {
      return;
    }

    String path = Platform.isWindows
        ? 'assets/icons/system_tray.ico'
        : 'assets/icons/system_tray.png';

    final SystemTray systemTray = SystemTray();

    // We first init the systray menu
    await systemTray.initSystemTray(
      title: "system tray",
      iconPath: path,
    );

    // handle system tray event
    systemTray.registerSystemTrayEventHandler((eventName) async {
      debugPrint("eventName: $eventName");

      if (eventName == kSystemTrayEventClick) {
        if (await windowManager.isVisible()) {
          debugPrint("closing window");
          await windowManager.hide();
        } else {
          debugPrint("opening window");
          await windowManager.show();
          // await windowManager.setSkipTaskbar(true);
        }
      }
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      autofocus: true,
      focusNode: FocusNode(),
      onKey: (event) {
        if (event.runtimeType == RawKeyUpEvent) {
          if (event.physicalKey == PhysicalKeyboardKey.escape) {
            windowManager.hide();
          }
        }
      },
      child: MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.lightBlue,
            primaryColor: Colors.black,
            textTheme: Theme.of(context)
                .textTheme
                .apply(bodyColor: Colors.black, displayColor: Colors.black)),
        home: const ProgressBar(),
      ),
    );
  }
}
