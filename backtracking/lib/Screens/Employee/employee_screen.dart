import 'package:backtracking/Screens/Welcome/Welcome_Screen.dart';
import 'package:flutter/material.dart';

import '../Welcome/components/Button.dart';

class EmployeeHomePage extends StatelessWidget {
  static const routeName = "/employee-home-screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Text("Normal employee"),
          ),
          Button(
            text: "LOG out",
            press: () {
              Navigator.of(context)
                  .pushReplacementNamed(WelcomeScreen.routeName);
            },
            color: Color(0xFF6F35A5),
            textColor: Colors.white,
            width: 200,
          ),
        ],
      ),
    );
  }
}
