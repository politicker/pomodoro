import 'package:flutter/material.dart';
import 'package:pomodoro/app_view.dart';
import 'package:pomodoro/components/blend_mask.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox.expand(
            child: Stack(children: [
      SizedBox.expand(child: App()),
      BlendMask(
          opacity: 1.0,
          blendMode: BlendMode.difference,
          child: SizedBox(
              width: 250,
              height: MediaQuery.of(context).size.height,
              child: const ColoredBox(color: Colors.white))),
    ])));
  }
}
