import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import '../app_data.dart';
import 'package:pomodoro/models/ticker.dart' as tick;

enum TimerStatus { initial, active, paused, complete }

class AppModel extends ChangeNotifier {
  Timer? _currentTimer;

  StreamSubscription<int>? _tickerSubscription;
  final ticker = tick.Ticker();

  late Duration workDuration;
  late String _currentTimerLabel;
  late int currentTimerSeconds = const Duration(minutes: 20).inSeconds;

  final database = AppData();

  AppModel() {
    _setWorkDuration();
  }

  int get currentTime => currentTimerSeconds;
  bool isRunning = false;

  void startTimer() async {
    isRunning = true;
    notifyListeners();
    await _tickerSubscription?.cancel();
    _tickerSubscription =
        ticker.tick(ticks: workDuration.inSeconds).listen(_handleTick);
  }

  void resetTimer() async {
    await _tickerSubscription?.cancel();

    currentTimerSeconds = workDuration.inSeconds;
    isRunning = false;
    notifyListeners();
  }

  void pauseTimer() {
    _tickerSubscription?.pause();
    isRunning = false;
    notifyListeners();
  }

  void resumeTimer() {
    _tickerSubscription?.resume();
    isRunning = true;
    notifyListeners();
  }

  void _handleTick(int seconds) {
    if (seconds == 0) {
      _onTimerComplete();
      return;
    }

    currentTimerSeconds = seconds;
    notifyListeners();
  }

  Future<void> save() async {
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

    workDuration = Duration(seconds: duration);
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

  void _onTimerComplete() {
    save();
    resetTimer();
  }
}
