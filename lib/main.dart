import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_macos_menubar_example/app_view.dart';
import 'package:provider/provider.dart';

import 'models/app_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
        create: (context) => AppModel(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pomodoro',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: const App(),
    );
  }
}
