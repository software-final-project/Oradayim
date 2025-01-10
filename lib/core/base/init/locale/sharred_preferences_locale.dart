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
  static const String gender = 'gender';
  static const String telNumber = 'telNumber';
  static const String isAdmin = 'isAdmin';
  static const String imgUrl = 'imgUrl';
  static const String locale = 'locale';
  static const String rememberMe = 'rememberMe';
  static const String adminId = 'adminId';
  static const String selectedHairdresserId = 'selectedHairdresserId';
  static const String selectedWorkerId = 'selectedWorkerId';
  static const String selectedWorkerName = 'selectedWorkerName';
  static const String selectedWorkerImg = 'selectedWorkerImg';
  static const String lastLogged = 'lastLogged';
  static const String userDeviceToken = 'userDeviceToken';
  static const String unreadNotificationsCount = 'unreadNotificationsCount';
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

  setTelNumber(String value) => _prefs!.setString(telNumber, value);
  String? getTelNumber() => _prefs!.getString(telNumber);

  setIsAdmin(bool value) => _prefs!.setBool(isAdmin, value);
  bool? getIsAdmin() => _prefs!.getBool(isAdmin);

  setGender(String value) => _prefs!.setString(gender, value);
  String? getGender() => _prefs!.getString(gender);

  setImage(String value) => _prefs!.setString(imgUrl, value);
  String? getImage() => _prefs!.getString(imgUrl);

  setLocale(String languageCode, String countryCode) {
    String myValue = '$languageCode-$countryCode';
    _prefs?.setString(locale, myValue);
  }

  String? getLocale() => _prefs!.getString(locale);

  setUserId(String value) => _prefs!.setString(adminId, value);
  String? getUserId() => _prefs!.getString(adminId);

  setLastLogged(String value) => _prefs!.setString(lastLogged, value);
  String? getLastLogged() => _prefs!.getString(lastLogged);

  setUnreadNotificationsCount(int value) =>
      _prefs!.setInt(unreadNotificationsCount, value);
  int? getUnreadNotificationsCount() =>
      _prefs!.getInt(unreadNotificationsCount);

  setSelectedWorkerName(String value) =>
      _prefs!.setString(selectedWorkerName, value);
  String? getSelectedWorkerName() => _prefs!.getString(selectedWorkerName);

  setSelectedWorkerImg(String value) =>
      _prefs!.setString(selectedWorkerImg, value);
  String? getSelectedWorkerImg() => _prefs!.getString(selectedWorkerImg);

  clear() {
    _prefs!.clear();
  }

  setRememberMe(bool value) {
    setBool(rememberMe, value);
  }

  bool? getRememberValue() {
    return getBool(rememberMe);
  }

  setSelectedWorkerId(String value) {
    setString(selectedWorkerId, value);
  }

  String? getSelectedWorkerId() {
    return getString(selectedWorkerId);
  }

  setUserDeviceToken(String value) {
    setString(userDeviceToken, value);
  }

  String? getUserDeviceToken() {
    return getString(userDeviceToken);
  }

  setSelectedHairdresserId(String value) {
    setString(selectedHairdresserId, value);
  }

  setThemeModeValue(String value) {
    setString(themeMode, value);
  }

  String? get getThemeMode => getString(themeMode);

  String? getSelectedHairdresserId() {
    return getString(selectedHairdresserId);
  }

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