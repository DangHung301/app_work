
import 'package:shared_preferences/shared_preferences.dart';

class PrefsService {
  static const _PREF_TOKEN = 'pref_token';
  static const _PREF_REFRESH_TOKEN = 'pref_token';
  // static const _PREF_PASSWORD_PRESENT = 'pref_password_present';
  // static const _PREF_APP_THEME = 'pref_app_theme';

  static SharedPreferences? _prefsInstance;

  static Future<SharedPreferences> get _instance async =>
      _prefsInstance ??= await SharedPreferences.getInstance();

  // call this method form iniState() function of mainApp().
  static Future<SharedPreferences> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance!;
  }

  static String getToken() {
    return _prefsInstance?.getString(_PREF_TOKEN) ?? '';
  }

  static Future<bool> saveToken(String token) async {
    final prefs = await _instance;
    return prefs.setString(_PREF_TOKEN, token);
  }

  static Future<void> removeToken() async {
    if(_prefsInstance?.containsKey(_PREF_TOKEN) ?? false) {
      _prefsInstance?.remove(_PREF_TOKEN);
    }
}

  static Future<bool> saveRefreshToken(String token) async {
    final prefs = await _instance;
    return prefs.setString(_PREF_REFRESH_TOKEN, token);
  }
}
