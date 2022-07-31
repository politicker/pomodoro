import 'package:flutter/material.dart';

class TallyMark extends StatelessWidget {
  const TallyMark({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: const BoxDecoration(
          color: Color.fromARGB(255, 225, 224, 224), shape: BoxShape.circle),
    );
  }
}
