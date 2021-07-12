import 'package:backtracking/Screens/Login/LoginScreen.dart';
import 'package:backtracking/Screens/Welcome/components/Background.dart';
import 'package:backtracking/Screens/Welcome/components/Button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
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
            press: () {
              Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
            },
            textColor: Colors.white,
            color: Theme.of(context).primaryColor,
          ),
          Button(
            text: "SIGNUP",
            press: () {},
            textColor: Colors.black,
            color: Color(0xFFF1E6FF),
          ),
        ],
      ),
    );
  }
}
