import 'package:flutter/material.dart';
import '../dashboard/dashboard_screen.dart';
import 'login_register.dart';

class WidgetTree extends StatelessWidget {
  const WidgetTree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // In this version, always navigate to the DashboardScreen
    return DashboardScreen();
  }
}
