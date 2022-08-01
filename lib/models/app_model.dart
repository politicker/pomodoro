import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pomodoro/models/ticker.dart' as tick;

import '../app_data.dart';

enum TimerStatus { initial, active, paused, complete }

class AppModel extends ChangeNotifier {
  StreamSubscription<int>? _tickerSubscription;
  final ticker = tick.Ticker();

  late Duration workDuration;
  late String _currentTimerLabel;
  late int currentTimerSeconds = const Duration(minutes: 20).inSeconds;

  TimerStatus status = TimerStatus.initial;

  final database = AppData();

  AppModel() {
    _setWorkDuration();
  }

  bool isRunning = false;

  void startTimer() async {
    status = TimerStatus.active;

    notifyListeners();
    await _tickerSubscription?.cancel();
    _tickerSubscription =
        ticker.tick(ticks: workDuration.inSeconds).listen(_handleTick);
  }

  void resetTimer() async {
    await _tickerSubscription?.cancel();

    status = TimerStatus.initial;
    currentTimerSeconds = workDuration.inSeconds;
    notifyListeners();
  }

  void pauseTimer() {
    _tickerSubscription?.pause();
    status = TimerStatus.paused;
    notifyListeners();
  }

  void resumeTimer() {
    _tickerSubscription?.resume();
    status = TimerStatus.active;
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
