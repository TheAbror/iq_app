import 'package:iq_app/core/preference_services/sh_pref_keys.dart';
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
}
