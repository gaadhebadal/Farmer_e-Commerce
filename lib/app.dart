import 'package:farmer_ecommerce/screens/splash_screen.dart';
import 'package:farmer_ecommerce/styles/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove the debug banner
      theme: themeData,
      home: SplashScreen(),
    );
  }
}
