import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

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

  Future<void> _createDatabase() async {
    final configPath = await _configFilePath();
    File(configPath).writeAsStringSync('{}', flush: true);
  }

  Future<String> _configFilePath() async {
    final directory = await getApplicationDocumentsDirectory();
    return '${directory.path}/$_fileName';
  }
}
