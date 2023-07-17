import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:raywings_flutter/splash_screen.dart';
import 'login_page.dart';
import 'otp.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
