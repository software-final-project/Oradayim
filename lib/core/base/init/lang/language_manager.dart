import 'package:flutter/material.dart';

import 'dart:ui' as ui;

import '../locale/sharred_preferences_locale.dart';

class LanguageManager {
  LanguageManager._init();

  static LanguageManager? _instance;

  static LanguageManager get instance {
    _instance ??= LanguageManager._init();
    return _instance!;
  }

  final enLocale = const Locale('en', 'US');
  final trLocale = const Locale('tr', 'TR');

  Locale getStartLocale() {
    final deviceLocale = ui.PlatformDispatcher.instance.locale;
    final String? savedLocale = SharedPreferencesUtil().getLocale();
    return savedLocale != null
        ? Locale(
        savedLocale.split('-')[0],
        savedLocale.split('-').length > 1
            ? savedLocale.split('-')[1]
            : '')
        : deviceLocale;
  }

  List<Locale> get supportedLocales => [enLocale, trLocale];
}