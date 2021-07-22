import 'package:flutter/material.dart';


import 'employee_drawer.dart';

class EmployeeHomePage extends StatelessWidget {
  static const routeName = "/employee-home-screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Employee"),
      ),
      drawer: EmployeeDrawer(),
      body: Column(
        children: [
          Center(
            child: Text("Driver"),
          ),
        ],
      ),
    );
  }
}
