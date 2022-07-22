import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class AppModel extends ChangeNotifier {
  Duration workDuration = const Duration(minutes: 20);
  Timer? _currentTimer;

  late String _currentTimerLabel;
  late int currentTimerSeconds;

  AppModel() {
    currentTimerSeconds = workDuration.inSeconds;
  }

  String get buttonText => _currentTimer == null ? "Start" : "Stop";

  String get currentTime {
    return _formatTime(currentTimerSeconds);
  }

  void toggleTimer() {
    if (_currentTimer != null) {
      _stopTimer();
      return;
    }

    _startTimer();
  }

  void setTimerLabel(String label) {
    _currentTimerLabel = label;
  }

  void setWorkDuration(int duration) {
    _stopTimer();

    workDuration = Duration(minutes: duration);
    currentTimerSeconds = workDuration.inSeconds;

    notifyListeners();
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

  void _stopTimer() {
    _currentTimer?.cancel();
    _currentTimer = null;
    currentTimerSeconds = workDuration.inSeconds;
    notifyListeners();
  }

  void _startTimer() {
    if (_currentTimer != null) {
      return;
    }

    currentTimerSeconds = currentTimerSeconds -= 1;
    notifyListeners();

    _currentTimer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        if (currentTimerSeconds == 0) {
          _stopTimer();
        } else {
          currentTimerSeconds = currentTimerSeconds -= 1;
          notifyListeners();
        }
      },
    );
  }
}
