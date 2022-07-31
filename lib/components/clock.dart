import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final textController = TextEditingController();

class Clock extends StatelessWidget {
  Clock(
      {Key? key,
      required this.time,
      required this.onChanged,
      this.readOnly = false})
      : super(key: key);

  final TextEditingController _controller = TextEditingController();

  final int time;
  final bool readOnly;
  final Function(int) onChanged;

  @override
  Widget build(BuildContext context) {
    var formatted = _formatTime(time);

    _controller.text = formatted;

    return TextField(
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp('\\d|:')),
        ],
        controller: _controller,
        readOnly: readOnly,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 120),
        onEditingComplete: () {
          var seconds = _clockTimeToSeconds(_controller.text);

          onChanged(_clockTimeToSeconds(_controller.text));
        },
        decoration: const InputDecoration(
          border: InputBorder.none,
        ));
  }

  int _clockTimeToSeconds(String time) {
    final List<String> parts = time.split(':');
    final int minutes = int.parse(parts[0]);
    final int seconds = int.parse(parts[1]);
    return minutes * 60 + seconds;
  }

  String _formatTime(int secTime) {
    String getParsedTime(String time) {
      if (time.length <= 1) return "0$time";
      return time;
    }

    int min = secTime ~/ 60;
    int sec = secTime % 60;

    String parsedTime =
        getParsedTime(min.toString()) + ":" + getParsedTime(sec.toString());

    return parsedTime;
  }
}
