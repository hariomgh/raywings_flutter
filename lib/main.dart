import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:raywings_flutter/splash_screen.dart';
import 'bottom_navigation.dart';
import 'login_page.dart';
import 'navigation_drawer.dart';
import 'otp.dart';

import 'package:raywings_flutter/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: SplashScreen(),
      home: Navigation_Drawer(),
    );
  }
}