import 'package:backtracking/components/OrDivider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Welcome/components/Button.dart';
import '../../components/already_have_an_account_acheck.dart';
import '../../components/rounded_input_field.dart';
import '../../components/rounded_password_field.dart';

import 'components/Sign_Up_background.dart';
import '../../Screens/Login/LogIn_Screen.dart';
import '../home.dart';

class SignUpScreen extends StatelessWidget {
  static const routeName = "/SignUp-Screen";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SignUpBackground(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Sign Up",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.purple[400]),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              SvgPicture.asset(
                "assets/icons/signup.svg",
                height: size.height * 0.4,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              RoundedInputField(
                hintText: "Your Email",
                onChanged: (value) {},
              ),
              RoundedPasswordField(
                onChanged: (value) {},
              ),
              Button(
                text: "Sign Up",
                press: () => Navigator.of(context).pushReplacementNamed(
                  HomeScreen.routeName,
                ),
                color: Color(0xFF6F35A5),
                textColor: Colors.white,
              ),
              AlreadyHaveAnAccountCheck(
                login: false,
                press: () => Navigator.of(context).pushReplacementNamed(
                  LogInScreen.routeName,
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
