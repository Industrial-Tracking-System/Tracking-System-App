import 'package:flutter/material.dart';

class DriverOrderDetail extends StatelessWidget {
  static const routeName = "/employee-Oder-screen";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Orders Details"),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: size.height * 0.4,
            decoration: BoxDecoration(color: Colors.black),
          ),
          ElevatedButton(onPressed: () {}, child: Text("DONE")),
        ],
      ),
    );
  }
}
