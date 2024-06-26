import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';


abstract class AppLocalStorage {
  Future<void> saveString(String key, String value);

  String? getString(String key, {String? defaultValue});

  Future<void> saveInt(String key, int value);

  int? getInt(String key, {int? defaultValue});

  Future<bool> removeValue(String key);

  Future<void> saveMap(String key, Map<String, dynamic> jsonMap);

  Map<String, dynamic>? getMap<T>(String key);

  Future<void> saveBool(String key, bool value);

  bool? getBool(String key, {bool? defaultValue});
}

@Injectable(as: AppLocalStorage)
class AppLocalStorageImpl extends AppLocalStorage {
  AppLocalStorageImpl(this._sharedPreferences);
  final SharedPreferences _sharedPreferences;

  @override
  Future<void> saveString(String key, String value) async {
    _sharedPreferences.setString(key, value);
  }

  @override
  String? getString(String key, {String? defaultValue}) {
    return _sharedPreferences.getString(key) ?? defaultValue;
  }

  @override
  Future<void> saveInt(String key, int value) async {
    _sharedPreferences.setInt(key, value);
  }

  @override
  int? getInt(String key, {int? defaultValue}) {
    return _sharedPreferences.getInt(key) ?? defaultValue;
  }

  @override
  Future<void> saveMap(String key, Map<String, dynamic> jsonMap) async {
    await _sharedPreferences.setString(key, json.encode(jsonMap));
  }

  @override
  Future<bool> removeValue(String key) async {
    return _sharedPreferences.remove(key);
  }

  @override
  Map<String, dynamic>? getMap<T>(String key) {
    final String? value = _sharedPreferences.getString(key);
    if (value != null) {
      return json.decode(_sharedPreferences.getString(key)!) as Map<String, dynamic>;
    } else {
      return null;
    }
  }

  @override
  bool? getBool(String key, {bool? defaultValue}) {
    return _sharedPreferences.getBool(key) ?? defaultValue;
  }

  @override
  Future<void> saveBool(String key, bool value) async {
    await _sharedPreferences.setBool(key, value);
  }
}
