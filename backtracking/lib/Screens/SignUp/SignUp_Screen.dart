import 'dart:convert';

import 'package:backtracking/Screens/Login/login_options.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Welcome/components/Button.dart';
import '../../components/already_have_an_account_acheck.dart';
import '../../components/rounded_input_field.dart';
import '../../components/rounded_password_field.dart';

import '../Customer/customer_home.dart';
import 'components/Sign_Up_background.dart';

import '../../api/api.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = "/SignUp-Screen";

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _companyNameController = TextEditingController();

  bool _isVerifying = false;

  void _handleSignUp() async {
    var data = {
      "email": _emailController.text,
      "password": _passwordController.text,
      "company_name": _companyNameController.text,
    };
    setState(() {
      _isVerifying = true;
    });
    await CallApi().postData(data, "register").then((respValue) {
      setState(() {
        _isVerifying = false;
      });
      Map<String, dynamic> userData = json.decode(respValue.body);
      print(userData["id"]);
      print(userData["email"]);
      Navigator.of(context).pushReplacementNamed(
        CustomerHomePage.routeName,
      );
    });
  }

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
                hintText: "Your Company Name",
                controller: _companyNameController,
              ),
              RoundedInputField(
                hintText: "Your Email",
                controller: _emailController,
              ),
              RoundedPasswordField(
                controller: _passwordController,
              ),
              Button(
                text: _isVerifying ? "Loading..." : "Sign Up",
                press: _isVerifying
                    ? null
                    : () {
                        _handleSignUp();
                      },
                color: Color(0xFF6F35A5),
                textColor: Colors.white,
                width: size.width * 0.8,
              ),
              AlreadyHaveAnAccountCheck(
                login: false,
                press: () => Navigator.of(context).pushReplacementNamed(
                  LoginOptions.routeName,
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
