import 'package:flutter/material.dart';
import 'package:pomodoro/app_view.dart';
import 'package:pomodoro/components/blend_mask.dart';
import 'package:pomodoro/models/app_model.dart';
import 'package:provider/provider.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox.expand(
            child: Stack(children: [
      SizedBox.expand(child: App()),
      IgnorePointer(
        child: BlendMask(
          opacity: 1.0,
          blendMode: BlendMode.difference,
          child: Consumer<AppModel>(builder: (context, timer, child) {
            return SizedBox(
                width: MediaQuery.of(context).size.width *
                    (1 -
                        (timer.currentTimerSeconds /
                            timer.workDuration.inSeconds)),
                height: MediaQuery.of(context).size.height,
                child: const ColoredBox(color: Colors.white));
          }),
        ),
      )
    ])));
  }
}
