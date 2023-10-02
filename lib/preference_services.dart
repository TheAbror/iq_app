import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class PreferencesServices {
  static Future<String?> getToken() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(ShPrefKeys.token);
  }

  static Future<bool> saveToken(String token) async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.setString(ShPrefKeys.token, token);
  }

  static Future<String?> getUserId() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(ShPrefKeys.id);
  }

  static Future<bool> saveUserId(String id) async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.setString(ShPrefKeys.id, id);
  }

  static Future<String?> getPasscode() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(ShPrefKeys.passcode);
  }

  static Future<String> savePasscode(String passcode) async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setString(ShPrefKeys.passcode, passcode);
    return passcode;
  }

  static Future<bool> saveIsPasscodeOn(bool passcode) async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.setBool(ShPrefKeys.passcode, passcode);
  }

  static Future<bool> clearAll() async {
    final preferences = await SharedPreferences.getInstance();
    return await preferences.clear();
  }

  static Future<bool> removePasscode() async {
    final preferences = await SharedPreferences.getInstance();
    return await preferences.remove(ShPrefKeys.passcode);
  }

  // Save the map to SharedPreferences
  static Future<void> saveMapToSharedPreferences(Map<dynamic, dynamic> map) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonString = json.encode(map);
    await prefs.setString(ShPrefKeys.mapKey, jsonString);
  }

// Retrieve the map from SharedPreferences
  static Future<Map<dynamic, dynamic>> getMapFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonString = prefs.getString(ShPrefKeys.mapKey);
    if (jsonString != null) {
      Map<dynamic, dynamic> map = json.decode(jsonString);
      return map;
    }
    return {}; // return an empty map when jsonString is null
  }
}

abstract class ShPrefKeys {
  static const email = 'email';
  static const sessionId = 'sessionId';
  static const isOnBoardingFinished = 'isOnBoardingFinished';
  static const token = 'token';
  static const id = 'id';
  static var passcodeEnabled = true;
  static var passcode = 'passcode';
  static var mapKey = 'mapKey';
}
