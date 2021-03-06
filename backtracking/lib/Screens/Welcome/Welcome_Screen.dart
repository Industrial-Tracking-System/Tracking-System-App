import 'package:backtracking/Screens/Login/login_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../SignUp/SignUp_Screen.dart';
import 'components/Welcome_Background.dart';
import 'components/Button.dart';

class WelcomeScreen extends StatelessWidget {
  static const routeName = "/welcome-screen";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: WelcomeBackground(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome to Home",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.purple[400]),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            SvgPicture.asset(
              "assets/icons/chat.svg",
              height: size.height * 0.6,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Button(
              text: "LOGIN",
              press: () => Navigator.of(context).pushNamed(
                LoginOptions.routeName,
              ),
              textColor: Colors.white,
              color: Theme.of(context).primaryColor,
              width: size.width * 0.8,
            ),
            Button(
              text: "SIGNUP",
              press: () => Navigator.of(context).pushNamed(
                SignUpScreen.routeName,
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
