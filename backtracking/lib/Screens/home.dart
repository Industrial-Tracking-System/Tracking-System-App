import 'package:backtracking/Screens/drawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = "HomeScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: Text("HomeScreen"),
      ),
    );
  }
}
