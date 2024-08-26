import 'package:shared_preferences/shared_preferences.dart';

class StorageServices {
  Future<bool> setBool(String key, bool value) async {
    final pref = await SharedPreferences.getInstance();
    return pref.setBool(key, value);
  }

  Future<bool?> getBool(String key) async {
    final pref = await SharedPreferences.getInstance();
    return pref.getBool(key);
  }
}
 