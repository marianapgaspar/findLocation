import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class LocalStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/history.json');
  }

  Future<void> saveHistory(List<dynamic> history) async {
    final file = await _localFile;
    List<dynamic>? existingData = await loadHistory();
    if (existingData != null) {
      history.addAll(existingData);
    }
    final jsonData = jsonEncode(history);
    await file.writeAsString(jsonData);
  }

  Future<List<dynamic>?> loadHistory() async {
    try {
      final file = await _localFile;
      if (await file.exists()) {
        final jsonData = await file.readAsString();
        return jsonDecode(jsonData);
      } else {
        return null;
      }
    } catch (e) {
      // Handle errors here
      print('Error loading history: $e');
      return null;
    }
  }
}
