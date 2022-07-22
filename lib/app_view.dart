import 'package:flutter/material.dart';
import 'package:flutter_macos_menubar_example/settings_view.dart';
import 'package:provider/provider.dart';
import 'package:audioplayers/audioplayers.dart';

import 'models/app_model.dart';

class App extends StatelessWidget {
  final startSoundPlayer = AudioPlayer();
  final finishSoundPlayer = AudioPlayer();

  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our app bar title.
        title: const Text("Pomodoro"),
        actions: [
          MaterialButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SettingsView(),
                  ),
                );
              },
              child: const Icon(Icons.settings))
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Consumer<AppModel>(
            builder: (context, model, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    onChanged: (value) {
                      model.setTimerLabel(value);
                    },
                  ),
                  const Spacer(),
                  Text(
                    model.currentTime,
                    style: const TextStyle(fontSize: 48),
                  ),
                  const Spacer(),
                  Row(children: [
                    Expanded(
                        child: ElevatedButton(
                            onPressed: () async {
                              await startSoundPlayer.setSource(
                                  AssetSource('sounds/timer_start.wav'));

                              if (!model.isRunning) {
                                startSoundPlayer.resume();
                              }

                              model.toggleTimer();
                            },
                            child: Text(model.buttonText))),
                  ])
                ],
              );
            },
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
