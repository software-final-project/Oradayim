import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:oradayim/core/init/auth/auth_wrapper.dart';
import 'package:oradayim/screens/auth/views/login/login_view.dart';
import 'package:oradayim/screens/auth/views/register/register_view.dart';

import 'dart:io' show Platform;

import '../screens/home/home_screen.dart';

class NavigationUtils {
  static final navigatorKey = GlobalKey<NavigatorState>();

  static const String loginScreen = "loginScreen";
  static const String registerScreen = "registerScreen";
  static const String homeScreen = "homeScreen";
  static const String authScreen = "authScreen";

  static _navigateToPage(context, String pageName, {Object? arguments}) =>
      Navigator.pushNamed(context, pageName, arguments: arguments);

  static _navigateToAndRemoveUntil(context, String pageName,
          {Object? arguments}) =>
      Navigator.pushNamedAndRemoveUntil(
          context, pageName, (Route<dynamic> route) => false,
          arguments: arguments);

  static navigateToBack(context, {dynamic value}) =>
      Navigator.pop(context, value);

  static navigateToLoginScreen(context) => _navigateToAndRemoveUntil(context, loginScreen);

  static navigateToHomeScreen(context) =>
      _navigateToAndRemoveUntil(context, homeScreen);

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
    Widget page = const AuthWrapper();

    switch (settings.name) {
      case loginScreen:
        page = const LoginView();
        break;
      case registerScreen:
        page = const RegisterView();
        break;  
      case homeScreen:
        page = const HomeScreen();
        break;
    }
    return page;
  }
}
