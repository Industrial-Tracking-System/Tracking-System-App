import 'package:backtracking/Modules/order.dart';
import 'package:backtracking/providers/Orders.dart';
import 'package:flutter/material.dart';

import '../Screens/drawer.dart';
import '../Widgets/order_item.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = "/order-screen";

  @override
  Widget build(BuildContext context) {
    final myOrders = Provider.of<Orders>(context).myOrders as List<Order>;
    return Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
          title: Text("Orders"),
        ),
        backgroundColor: Colors.white,
        body: ListView.builder(
          itemBuilder: (context, index) => OrderItem(
            companyName: myOrders[index].companyName,
            factoryName: myOrders[index].factoryName,
            id: myOrders[index].id,
            quantity: myOrders[index].quantity,
            status: myOrders[index].status,
          ),
          itemCount: myOrders.length,
        ));
  }
}
