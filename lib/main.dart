import 'dart:io';

// import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:pomodoro/app_view.dart';
import 'package:provider/provider.dart';
import 'package:system_tray/system_tray.dart';
import 'package:window_manager/window_manager.dart';

import 'models/app_model.dart';

void main() async {
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
          windowManager.hide();
        } else {
          debugPrint("opening window");
          windowManager.show();
        }
      }
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pomodoro',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: App(),
    );
  }
}
