import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:oradayim/core/base/init/application_initialize.dart';
import 'package:oradayim/core/base/init/lang/language_manager.dart';
import 'package:oradayim/utils/navigation_util.dart';

void main() async {
  await ApplicationInitialize().make();

  runApp(EasyLocalization(
      supportedLocales: LanguageManager.instance.supportedLocales,
      path: LanguageManager.instance.path,
      startLocale: LanguageManager.instance.getStartLocale(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: NavigationUtils.navigatorKey,
      title: 'Oradayim',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1E88E5),
        ),
        useMaterial3: true,
      ),
      initialRoute: NavigationUtils.authScreen,
      onGenerateRoute: NavigationUtils.onGenerateRoute,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      localizationsDelegates: context.localizationDelegates,
    );
  }
}
