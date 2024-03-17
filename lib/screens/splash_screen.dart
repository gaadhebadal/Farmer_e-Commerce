import 'dart:async';
import 'package:farmer_ecommerce/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import '../styles/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    const delay = Duration(seconds: 3);
    Timer(delay, onTimerFinished);
  }

  void onTimerFinished() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return WelcomeScreen();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: splashScreenIcon(),
      ),
    );
  }
}

Widget splashScreenIcon() {
  const String iconPath = "assets/icons/app_icon.svg";
  return SvgPicture.asset(
    iconPath,
  );
}
