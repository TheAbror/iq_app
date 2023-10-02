import 'package:iq_app/core/preference_services/sh_pref_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesServices {
  static Future<String?> getName() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(ShPrefKeys.name);
  }

  static Future<bool> saveName(String token) async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.setString(ShPrefKeys.name, token);
  }

  static Future<String?> getAge() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString(ShPrefKeys.age);
  }

  static Future<bool> saveAge(String age) async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.setString(ShPrefKeys.age, age);
  }

  static Future<bool> clearAll() async {
    final preferences = await SharedPreferences.getInstance();
    return await preferences.clear();
  }
}
