import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../screens/login/login_screen.dart';
import '../screens/register/register_screen.dart';

class NavigationUtils {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static const String loginScreen = "loginScreen";
  static const String registerScreen = "registerScreen";
  static const String authScreen = "authScreen";
  static const String homeScreen = "homeScreen";

  static _navigateToPage(context, String pageName, {Object? arguments}) =>
      Navigator.pushNamed(context, pageName, arguments: arguments);

  static _navigateToAndRemoveUntil(context, String pageName,
          {Object? arguments}) =>
      Navigator.pushNamedAndRemoveUntil(
          context, pageName, (Route<dynamic> route) => false,
          arguments: arguments);

  static navigateToBack(context, {dynamic value}) =>
      Navigator.pop(context, value);

  static navigateToHomeScreen(context) =>
      _navigateToAndRemoveUntil(context, homeScreen);

  static navigateToLoginScreen(context) =>
      _navigateToAndRemoveUntil(context, loginScreen);

  static navigateToRegisterScreen(context) =>
      _navigateToAndRemoveUntil(context, registerScreen);

  static Route onGenerateRoute(settings) {
    return _buildPageRoute(
      settings: settings,
      builder: (context) => _buildNavigationMap(context, settings),
    );
  }

  static PageRoute _buildPageRoute(
      {required RouteSettings settings, required WidgetBuilder builder}) {
    if (Platform.isIOS) {
      return CupertinoPageRoute(
        builder: builder,
        settings: settings,
      );
    } else {
      return MaterialPageRoute(
        builder: builder,
        settings: settings,
      );
    }
  }

  static _buildNavigationMap(context, settings) {
    Widget page = const AuthGateScreen();

    switch (settings.name) {
      case loginScreen:
        page = const LoginScreen();
        break;
      case registerScreen:
        page = const RegisterScreen();
        break;
      case homeScreen:
        page = const HomeScreen();
        break;
    }
    return page;
  }
}
