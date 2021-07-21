import 'dart:convert';

import 'package:backtracking/Screens/customer_home.dart';
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

class LogInScreen extends StatefulWidget {
  static const routeName = "/Login-Screen";

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  int _isManager;

  bool _isVerifying = false;

  void directUser() {
    if (_isManager == 1)
      Navigator.of(context).pushReplacementNamed(
        ProductionScreen.routeName,
      );
    else if (_isManager == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Wrong Data'),
          content: Text("You have entered wrong password or email!!"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("try again"),
            ),
          ],
        ),
      );
    } else {
      Navigator.of(context).pushReplacementNamed(
        CustomerHomePage.routeName,
      );
    }
  }

  void _handleLogin() async {
    var data = {
      "email": _emailController.text,
      "password": _passwordController.text,
    };
    setState(() {
      _isVerifying = true;
    });
    await CallApi().postData(data, "login").then((respValue) {
      setState(() {
        _isVerifying = false;
      });
      Map<String, dynamic> map = json.decode(respValue.body);
      print(respValue.body);
      print("is_manager:   " + map["is_manager"].toString());
      _isManager = map["is_manager"];
      directUser();
    });
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
                text: _isVerifying ? "Loading..." : "LOGIN",
                press: _isVerifying ? null : () {
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
