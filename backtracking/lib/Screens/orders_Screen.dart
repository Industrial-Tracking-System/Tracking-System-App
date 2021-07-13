import 'package:flutter/material.dart';

import '../Screens/drawer.dart';
import '../Widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = "/order-screen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
          title: Text("Orders"),
        ),
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            OrderItem(
              companyName: "Al-Shoruk Group",
              status: "on the road",
              quantity: 1500,
              factoryName: "Al-Haram",
            ),
            OrderItem(
              companyName: "Al-Shoruk Group",
              status: "on the road",
              quantity: 1500,
              factoryName: "Al-Haram",
            ),
            OrderItem(
              companyName: "Al-Shoruk Group",
              status: "on the road",
              quantity: 1500,
              factoryName: "Al-Haram",
            ),
            OrderItem(
              companyName: "Al-Shoruk Group",
              status: "on the road",
              quantity: 1500,
              factoryName: "Al-Haram",
            ),
            OrderItem(
              companyName: "Al-Shoruk Group",
              status: "on the road",
              quantity: 1500,
              factoryName: "Al-Haram",
            ),
            OrderItem(
              companyName: "Al-Shoruk Group",
              status: "on the road",
              quantity: 1500,
              factoryName: "Al-Haram",
            ),
            OrderItem(
              companyName: "Al-Shoruk Group",
              status: "on the road",
              quantity: 1500,
              factoryName: "Al-Haram",
            ),
          ],
        ));
  }
}
