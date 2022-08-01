import 'package:flutter/material.dart';
import 'package:pomodoro/components/timer_action_button.dart';
import 'package:pomodoro/models/app_model.dart';

class ActionBar extends StatelessWidget {
  const ActionBar({Key? key, required this.timer}) : super(key: key);

  final AppModel timer;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      TimerActionButton(
          icon: timer.isRunning ? Icons.pause : Icons.play_arrow,
          onPressed: timer.isRunning ? timer.pauseTimer : timer.startTimer),
      const SizedBox(width: 30),
      TimerActionButton(icon: Icons.refresh, onPressed: timer.resetTimer),
      const SizedBox(width: 30),
      TimerActionButton(icon: Icons.settings, onPressed: () {}),
    ]);
  }
}
