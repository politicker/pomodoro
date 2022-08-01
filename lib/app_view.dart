import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:pomodoro/components/action_bar.dart';
import 'package:pomodoro/components/clock.dart';
import 'package:pomodoro/components/timer_action_button.dart';
import 'package:provider/provider.dart';

import 'components/editable_label.dart';
import 'models/app_model.dart';

class App extends StatelessWidget {
  final startSoundPlayer = AudioPlayer();
  final finishSoundPlayer = AudioPlayer();

  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Consumer<AppModel>(
            builder: (context, timer, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Spacer(),
                  EditableLabel(onChanged: timer.setTimerLabel),
                  Clock(
                    time: timer.currentTime,
                    readOnly: timer.isRunning,
                    onChanged: timer.setWorkDuration,
                  ),
                  const Spacer(),
                  ActionBar(
                    timer: timer,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
