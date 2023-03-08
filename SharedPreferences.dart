import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static SharedPreferences? sharedPreferences;

  static InitSharedPreferences() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> SaveData({required key, required value}) async {
    if (value is bool)
      return sharedPreferences!.setBool(key, value);
    else if (value is String)
      return sharedPreferences!.setString(key, value);
    else if (value is double)
      return sharedPreferences!.setDouble(key, value);
    else
      return sharedPreferences!.setInt(key, value);
  }

  static dynamic GetSharedPref({required String key}) async {
    return await sharedPreferences!.get(key);
  }

  static Future<bool> RemoveData({required key}) async {
    return await sharedPreferences!.remove(key).catchError((onError) {
      return onError;
    });
  }
}
