import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

/*
 * AppData class
 *
 * This class is used to store and load data from the local storage.
 *
 * The data is stored in a JSON file.
 *
 * The data is loaded from the JSON file when the app is started.
 *
 * The data structure is: { settings: { workDuration: 'minutesCount' }, pomodoros: { 'pomodoro name': 'count of completed' } }
 */

class AppData {
  final String _fileName = 'database.json';

  AppData() {
    _createDatabase();
  }

  Future<Map<String, dynamic>> load() async {
    final configPath = await _configFilePath();
    final file = File(configPath).readAsStringSync();

    return jsonDecode(file);
  }

  void update(Map<String, dynamic> data) async {
    final raw = jsonEncode(data);
    final configPath = await _configFilePath();

    File(configPath).writeAsStringSync(raw, flush: true);
  }

  // TODO: Only do this on first app start
  Future<void> _createDatabase() async {
    final configPath = await _configFilePath();
    final file = File(configPath);

    if (file.existsSync()) {
      return;
    }

    file.writeAsStringSync('{ "settings": {}, "pomodoros": {} }', flush: true);
  }

  Future<String> _configFilePath() async {
    final directory = await getApplicationDocumentsDirectory();
    return '${directory.path}/$_fileName';
  }
}
