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

  static Future<bool> clearAll() async {
    final preferences = await SharedPreferences.getInstance();
    return await preferences.clear();
  }

  static Future<bool> removePasscode() async {
    final preferences = await SharedPreferences.getInstance();
    return await preferences.remove(ShPrefKeys.passcode);
  }
}
//TODO move to diff page

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
