import 'dart:convert';

import 'package:backtracking/api/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Welcome/components/Button.dart';
import '../../components/already_have_an_account_acheck.dart';
import '../../components/rounded_input_field.dart';
import '../../components/rounded_password_field.dart';

import 'components/Log_in_background.dart';
import '../SignUp/SignUp_Screen.dart';

class LogInScreen extends StatelessWidget {
  static const routeName = "/Login-Screen";
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _handleLogin() async {
    var data = {
      "email": _emailController.text,
      "password": _passwordController.text,
    };

    var response = await CallApi().postData(data, "login");
    Map<String, dynamic> map = json.decode(response.body);

    print("ID:   " + map["id"].toString());
    print("Email:   " + map["email"].toString());
    print("phone:   " + map["phone"].toString());
    print("job_tittle:   " + map["job_tittle"].toString());
  }

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
                controller: _emailController,
              ),
              RoundedPasswordField(
                onChanged: (value) {},
                controller: _passwordController,
              ),
              Button(
                text: "LOGIN",
                press: () {
                  print("login");
                  _handleLogin();
                },
                color: Color(0xFF6F35A5),
                textColor: Colors.white,
                width: size.width * 0.8,
              ),
              AlreadyHaveAnAccountCheck(
                login: true,
                press: () => Navigator.of(context).pushReplacementNamed(
                  SignUpScreen.routeName,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
