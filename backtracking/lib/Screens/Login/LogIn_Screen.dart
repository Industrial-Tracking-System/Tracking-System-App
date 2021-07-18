import 'dart:convert';

import 'package:backtracking/Screens/production.dart';
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
    // var data = {
    //   "email": _emailController.text,
    //   "password": _passwordController.text,
    // };
    var data = {
      "email": "moh1@factory",
      "password": "123",
    };
    print("ddd");
    print("email :" + _emailController.text);
    print(_passwordController.text);
    var res = await CallApi().postData(data, "login");
    var body = json.decode(res.body);
    print("body:   " + body);
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
              // TextField(
              //   controller: _emailController,
              //   cursorColor: Color(0xFF6F35A5),
              //   decoration: InputDecoration(
              //     // icon: Icon(
              //     //   icon,
              //     //   color: Color(0xFF6F35A5),
              //     // ),
              //     hintText: "enter email",
              //     border: InputBorder.none,
              //   ),
              // ),
              // TextField(
              //   controller: _passwordController,
              //   cursorColor: Color(0xFF6F35A5),
              //   decoration: InputDecoration(
              //     // icon: Icon(
              //     //   icon,
              //     //   color: Color(0xFF6F35A5),
              //     // ),
              //     hintText: "enter password",
              //     border: InputBorder.none,
              //   ),
              // ),
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
