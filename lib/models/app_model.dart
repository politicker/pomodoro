import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import '../app_data.dart';

class AppModel extends ChangeNotifier {
  Duration workDuration = const Duration(minutes: 20);
  Timer? _currentTimer;

  late String _currentTimerLabel;
  late int currentTimerSeconds;

  final database = AppData();

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

  Future<void> saveCurrentTimer() async {
    final data = await database.load();

    if (data.containsKey(_currentTimerLabel)) {
      final count = int.parse(data[_currentTimerLabel]);
      data[_currentTimerLabel] = '${count + 1}';
    } else {
      data[_currentTimerLabel] = '1';
    }

    database.update(data);
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

  void _onTimerComplete() {
    saveCurrentTimer();
    _stopTimer();
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
          _onTimerComplete();
        } else {
          currentTimerSeconds = currentTimerSeconds -= 1;
          notifyListeners();
        }
      },
    );
  }
}
