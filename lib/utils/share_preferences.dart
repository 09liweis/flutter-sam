import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static final Future<SharedPreferences> _prefs =
      SharedPreferences.getInstance();

  static Future<void> setString(String key, String value) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString(key, value);
  }

  static Future<String?> getString(String key) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString(key);
  }

  static Future<String?> getUserToken() async {
    return getString('userToken');
  }

  static Future<void> setUserToken(String value) async {
    setString('userToken', value);
  }

  static Future<void> setAPIRoutes(Map apiRoutes) async {
    setString('apiRoutes', apiRoutes.toString());
  }

  static Future<Map> getAPIRoutes() async {
    String? apiRoutes = await getString('apiRoutes');
    print(apiRoutes);
    return {};
  }
}
