import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUtil {
  static final SharedPreferencesUtil _singleton =
      SharedPreferencesUtil._internal();

  static SharedPreferences? _prefs;

  factory SharedPreferencesUtil() => _singleton;

  //Keys
  static const String eMail = 'email';
  static const String fullName = 'fullName';
  static const String userId = 'userId';
  static const String imgUrl = 'imgUrl';
  static const String locale = 'locale';
  static const String rememberMe = 'rememberMe';
  static const String lastLogged = 'lastLogged';
  static const String userDeviceToken = 'userDeviceToken';
  static const String themeMode = 'themeMode';
  SharedPreferencesUtil._internal() {
    _init();
  }

  _init() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  remove(String key) => _prefs!.remove(key);
  removeAll() async => await _prefs!.clear();

  static Future<void> ensureInitialized() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  setString(String key, String value) => _prefs!.setString(key, value);
  String? getString(String key) => _prefs!.getString(key);

  setBool(String key, bool value) => _prefs!.setBool(key, value);
  bool? getBool(String key) => _prefs!.getBool(key);

  setInt(String key, int value) => _prefs!.setInt(key, value);
  int? getInt(String key) => _prefs!.getInt(key);

  setEmail(String value) => _prefs!.setString(eMail, value);
  String? getEmail() => _prefs!.getString(eMail);

  setFullName(String value) => _prefs!.setString(fullName, value);
  String? getFullName() => _prefs!.getString(fullName);

  setImage(String value) => _prefs!.setString(imgUrl, value);
  String? getImage() => _prefs!.getString(imgUrl);

  setLocale(String languageCode, String countryCode) {
    String myValue = '$languageCode-$countryCode';
    _prefs?.setString(locale, myValue);
  }

  String? getLocale() => _prefs!.getString(locale);

  setLastLogged(String value) => _prefs!.setString(lastLogged, value);
  String? getLastLogged() => _prefs!.getString(lastLogged);

  clear() {
    _prefs!.clear();
  }

  setRememberMe(bool value) {
    setBool(rememberMe, value);
  }

  bool? getRememberValue() {
    return getBool(rememberMe);
  }

  setUserDeviceToken(String value) {
    setString(userDeviceToken, value);
  }

  String? getUserDeviceToken() {
    return getString(userDeviceToken);
  }

  setThemeModeValue(String value) {
    setString(themeMode, value);
  }

  String? get getThemeMode => getString(themeMode);

  Future<void> clearAllExceptRememberMe() async {
    final rememberMeValue = getRememberValue();
    final emailValue = getEmail();
    final localeValue = getLocale();
    await removeAll();
    if (rememberMeValue != null && emailValue != null && localeValue != null) {
      setRememberMe(rememberMeValue);
      setEmail(emailValue);
      final locales = localeValue.split("-");
      setLocale(locales[0], locales[1]);
    }
  }
}
