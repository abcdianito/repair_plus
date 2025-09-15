import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '/views/onboarding.dart'; // Import your onboarding file

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RePair+',
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColor: const Color(0xFF1ABC9C),
        fontFamily: 'Roboto',
        appBarTheme: const AppBarTheme(
          color: Color(0xFF1ABC9C),
          elevation: 0,
        ),
      ),
      home: OnboardingScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}