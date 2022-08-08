import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:pomodoro/components/action_bar.dart';
import 'package:pomodoro/components/clock.dart';
import 'package:pomodoro/generated/operations.graphql.dart';
import 'package:provider/provider.dart';

import 'components/editable_label.dart';
import 'components/progress_tally.dart';
import 'models/app_model.dart';

class App extends HookWidget {
  final startSoundPlayer = AudioPlayer();
  final finishSoundPlayer = AudioPlayer();

  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final result = useQuery$getPomodoros().result;
    final parsedData = result.parsedData;

    if (result.hasException) {
      return Text(result.exception.toString());
    }

    if (result.isLoading || parsedData == null) {
      return const Text('Loading');
    }

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Consumer<AppModel>(
            builder: (context, timer, child) {
              return Row(
                children: [
                  Expanded(
                    child: Column(
                      children: parsedData.pomodoros
                          .map((pomodoro) => Container(
                                width: 60,
                                height: 60,
                                decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFFe0f2f1)),
                              ))
                          .toList(),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        EditableLabel(onChanged: timer.setTimerLabel),
                        Clock(
                          time: timer.currentTimerSeconds,
                          readOnly: timer.status != TimerStatus.initial,
                          onChanged: timer.setWorkDuration,
                        ),
                        ActionBar(
                          timer: timer,
                        ),
                      ],
                    ),
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
