import 'package:backtracking/Screens/Login/components/Log_in_Body.dart';
import 'package:backtracking/Screens/Login/components/Log_in_background.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = "LoginScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LogInBody(),
    );
  }
}
