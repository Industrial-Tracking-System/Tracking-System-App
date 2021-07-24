import 'dart:convert';

import 'package:backtracking/Screens/Customer/customer_home.dart';
import 'package:backtracking/Screens/Employee/employee_Home_screen.dart';
import 'package:backtracking/Screens/Manager/production.dart';
import 'package:backtracking/api/api.dart';
import 'package:backtracking/providers/Employees.dart';
import 'package:backtracking/providers/Orders.dart';
import 'package:backtracking/providers/customers.dart';
import 'package:backtracking/providers/inventories.dart';
import 'package:backtracking/providers/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

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

  bool _isVerifying = false;
  void directCustomer(Map<String, dynamic> userData) async {
    if (userData["message"] != null) {
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
      Provider.of<Customers>(context, listen: false)
          .setCurrentCustomer(userData);
      await Provider.of<Products>(context, listen: false).fetchandSetData();
      Navigator.of(context).pushReplacementNamed(CustomerHomePage.routeName);
    }
  }

  void directEmployee(Map<String, dynamic> userData) async {
    if (userData["message"] != null) {
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
    } else if (userData["is_manager"] == 1) {
      Provider.of<Employees>(context, listen: false).fetchandSetData();
      Provider.of<Employees>(context, listen: false)
          .setCurrentEmployeeData(userData);
      Provider.of<Products>(context, listen: false).fetchandSetData();
      Provider.of<Orders>(context, listen: false).fetchandSetData("orders");
      await Provider.of<Customers>(context, listen: false).fetchandSetData();
      Provider.of<Inventories>(context, listen: false).fetchandSetData();
      Navigator.of(context).pushReplacementNamed(
        ProductionScreen.routeName,
      );
    } else {
      Provider.of<Employees>(context, listen: false)
          .setCurrentEmployeeData(userData);
      Provider.of<Orders>(context, listen: false)
          .fetchandSetData("employees/${userData["id"]}/orders");
      Orders orderObj = Provider.of<Orders>(context, listen: false);
      await orderObj.fetchOrderToDriver(userData["id"].toString());
      if (orderObj.getcurrentOrderToDeliver != null) {
        await Provider.of<Customers>(context, listen: false)
            .fetchCustomer((orderObj.getcurrentOrderToDeliver.customer_id));
        await Provider.of<Inventories>(context, listen: false)
            .fetchInventory((orderObj.getcurrentOrderToDeliver.inventory_id));
      }
      Navigator.of(context).pushReplacementNamed(
        EmployeeHomePage.routeName,
      );
    }
  }

  void _handleLogin(String userType) async {
    var data = {
      "email": _emailController.text,
      "password": _passwordController.text,
    };
    setState(() {
      _isVerifying = true;
    });
    await CallApi()
        .postData(data, userType == "customer" ? "customerlogin" : "login")
        .then((respValue) {
      setState(() {
        _isVerifying = false;
      });
      Map<String, dynamic> userData = json.decode(respValue.body);

      userType == "customer"
          ? directCustomer(userData)
          : directEmployee(userData);
    });
  }

  @override
  Widget build(BuildContext context) {
    final String _userType =
        ModalRoute.of(context).settings.arguments as String;
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
                press: _isVerifying
                    ? null
                    : () {
                        _handleLogin(_userType);
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
