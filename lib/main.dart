import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pomodoro/components/progress_bar.dart';
import 'package:pomodoro/generated/operations.graphql.dart';
import 'package:provider/provider.dart';
import 'package:system_tray/system_tray.dart';
import 'package:window_manager/window_manager.dart';

import 'models/app_model.dart';

class FakeLink extends Link {
  @override
  Stream<Response> request(Request request, [NextLink? forward]) async* {
    yield const Response(
      data: null,
      response: {},
    );
  }
}

final FakeLink link = FakeLink();

final graphqlClient = GraphQLClient(
  link: link,
  // The default store is the InMemoryStore, which does NOT persist to disk
  cache: GraphQLCache(store: HiveStore()),
);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Must add this line.
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
      size: Size(700, 400),
      minimumSize: Size(700, 400),
      maximumSize: Size(700, 400),
      center: true,
      backgroundColor: Colors.transparent,
      skipTaskbar: true,
      titleBarStyle: TitleBarStyle.hidden,
      alwaysOnTop: true);

  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });

  await initHiveForFlutter();

  final ValueNotifier<GraphQLClient> clientNotifier =
      ValueNotifier(graphqlClient);

  final queryRequest =
      const Operation(document: documentNodeQuerygetPomodoros).asRequest();

  var data = graphqlClient.readQuery(queryRequest);

  if (data == null) {
    data = {'pomodoros': [], '__typename': 'Query'};

    graphqlClient.writeQuery(queryRequest, data: data);
  }

  runApp(
    ChangeNotifierProvider(
        create: (context) => AppModel(),
        child: GraphqlWrapper(client: clientNotifier)),
  );
}

class GraphqlWrapper extends StatelessWidget {
  final ValueNotifier<GraphQLClient> client;

  const GraphqlWrapper({Key? key, required this.client}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(child: const MyApp(), client: client);
  }
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
        ? 'assets/icons/tomato.ico'
        : 'assets/icons/tomato.png';

    final SystemTray systemTray = SystemTray();

    // We first init the systray menu
    await systemTray.initSystemTray(
      iconPath: path,
    );

    // handle system tray event
    systemTray.registerSystemTrayEventHandler((eventName) async {
      if (eventName == kSystemTrayEventClick) {
        if (await windowManager.isVisible()) {
          await windowManager.hide();
        } else {
          await windowManager.show();
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
            textTheme: GoogleFonts.firaCodeTextTheme()),
        home: const ProgressBar(),
      ),
    );
  }
}
