import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:oradayim/utils/navigation_util.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
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
    );
  }
}
