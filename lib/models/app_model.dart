import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import '../app_data.dart';

class AppModel extends ChangeNotifier {
  Timer? _currentTimer;

  late Duration workDuration;
  late String _currentTimerLabel;
  late int currentTimerSeconds = const Duration(minutes: 20).inSeconds;

  final database = AppData();

  AppModel() {
    _setWorkDuration();
    // currentTimerSeconds = workDuration.inSeconds;
  }

  String get buttonText => _currentTimer == null ? "Start" : "Stop";

  String get currentTime {
    return _formatTime(currentTimerSeconds);
  }

  bool get isRunning => _currentTimer != null;

  void toggleTimer() {
    if (_currentTimer != null) {
      _stopTimer();
      return;
    }

    _startTimer();
  }

  Future<void> saveCurrentTimer() async {
    final data = await database.load();
    final pomodoros = data['pomodoros'] as Map<String, dynamic>;

    if (pomodoros.containsKey(_currentTimerLabel)) {
      final count = int.parse(pomodoros[_currentTimerLabel]);
      pomodoros[_currentTimerLabel] = '${count + 1}';
    } else {
      pomodoros[_currentTimerLabel] = '1';
    }

    database.update(data);
  }

  void setTimerLabel(String label) {
    _currentTimerLabel = label;
  }

  void setWorkDuration(int duration) async {
    _stopTimer();

    workDuration = Duration(minutes: duration);
    currentTimerSeconds = workDuration.inSeconds;

    final data = await database.load();
    final settings = data['settings'] as Map<String, dynamic>;

    settings['workDuration'] = workDuration.inMinutes;

    database.update(data);

    notifyListeners();
  }

  Future<void> _setWorkDuration() {
    return database.load().then((data) {
      final settings = data['settings'] as Map<String, dynamic>;

      workDuration = Duration(minutes: settings['workDuration']);
      currentTimerSeconds = workDuration.inSeconds;
      notifyListeners();
    });
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
