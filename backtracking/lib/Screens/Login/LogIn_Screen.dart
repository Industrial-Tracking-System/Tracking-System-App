import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Welcome/components/Button.dart';
import '../../components/already_have_an_account_acheck.dart';
import '../../components/rounded_input_field.dart';
import '../../components/rounded_password_field.dart';

import 'components/Log_in_background.dart';

class LogInScreen extends StatelessWidget {
  static const routeName = "/Login-Screen";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: LoginBackground(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "LOGIN",
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
                text: "LOGIN",
                press: () {},
                color: Color(0xFF6F35A5),
                textColor: Colors.white,
              ),
              AlreadyHaveAnAccountCheck(
                login: true,
                press: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
