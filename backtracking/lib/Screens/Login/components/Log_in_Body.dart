import 'package:backtracking/Screens/Welcome/components/Button.dart';
import 'package:backtracking/components/already_have_an_account_acheck.dart';
import 'package:backtracking/components/rounded_input_field.dart';
import 'package:backtracking/components/rounded_password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'Log_in_background.dart';

class LogInBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LoginBackground(
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
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}
