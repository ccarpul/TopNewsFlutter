import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreferences {
  static final Future<SharedPreferences> _prefs =
      SharedPreferences.getInstance();

  static save(String key, dynamic value) async {
    final prefs = await _prefs;
    if (value is int) {
      prefs.setInt(key, value);
    }
    if (value is String) {
      prefs.setString(key, value);
    }
    if (value is double) {
      prefs.setDouble(key, value);
    }
    if (value is bool) {
      prefs.setBool(key, value);
    }
    if (value is List<String>) {
      prefs.setStringList(key, value);
    }
  }

  static Future<String> getString(String key) async {
    final prefs = await _prefs;
    return prefs.getString(key) ?? '';
  } 
  static Future<int> getInt(String key) async {
    final prefs = await _prefs;
    return prefs.getInt(key) ?? 0;
  }

  static Future<bool> getBoolean(String key) async {
    final prefs = await _prefs;
    return prefs.getBool(key) ?? false;
  }
  static Future<double> getDouble(String key) async {
    final prefs = await _prefs;
    return prefs.getDouble(key) ?? 0.0;
  }
  static Future<List<String>> getStringList(String key) async {
    final prefs = await _prefs;
    return prefs.getStringList(key) ?? [];
  }
}
