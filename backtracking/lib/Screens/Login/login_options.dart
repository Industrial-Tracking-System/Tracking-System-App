import 'package:backtracking/Screens/Login/components/Log_in_background.dart';
import 'package:backtracking/Screens/Welcome/components/Button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Login/LogIn_Screen.dart';

class LoginOptions extends StatelessWidget {
  static const routeName = "/LoginOptions-screen";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: LoginBackground(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Log in As ???? ",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.purple[400]),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.6,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Button(
              text: "Customer ",
              press: () => Navigator.of(context).pushNamed(
                LogInScreen.routeName,
                arguments: "customer",
              ),
              textColor: Colors.white,
              color: Theme.of(context).primaryColor,
              width: size.width * 0.8,
            ),
            Button(
              text: "Employee",
              press: () => Navigator.of(context).pushNamed(
                LogInScreen.routeName,
                arguments: "Employee",
              ),
              textColor: Colors.black,
              color: Color(0xFFF1E6FF),
              width: size.width * 0.8,
            ),
          ],
        ),
      ),
    );
  }
}
