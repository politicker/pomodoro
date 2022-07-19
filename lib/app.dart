import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/app_model.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text("Pomodoro"),
        actions: [
          MaterialButton(onPressed: () {}, child: const Icon(Icons.settings))
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
                  const Spacer(),
                  Text(
                    model.currentTime(),
                  ),
                  const Spacer(),
                  Row(children: [
                    Expanded(
                        child: ElevatedButton(
                            onPressed: () {
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
