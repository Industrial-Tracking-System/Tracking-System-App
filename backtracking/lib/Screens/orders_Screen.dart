import 'package:backtracking/Modules/order.dart';
import 'package:backtracking/providers/Orders.dart';
import 'package:backtracking/providers/customers.dart';
import 'package:backtracking/providers/inventories.dart';
import 'package:flutter/material.dart';

import '../Screens/drawer.dart';
import '../Widgets/order_item.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = "/order-screen";

  @override
  Widget build(BuildContext context) {
    final myOrders = Provider.of<Orders>(context).myOrders as List<Order>;
    final customer = Provider.of<Customers>(context);
    final inventory = Provider.of<Inventories>(context);

    return Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(
          title: Text("Orders"),
        ),
        backgroundColor: Colors.white,
        body: ListView.builder(
          itemBuilder: (context, index) => OrderItem(
            companyName: customer
                .findCustomerById(myOrders[index].customer_id)
                .company_name,
            inventoryName: inventory
                .findInventoryByid(myOrders[index].inventory_id)
                .inventory_name,
            id: myOrders[index].id,
            quantity: myOrders[index].quantity,
            status: myOrders[index].status,
          ),
          itemCount: myOrders.length,
        ));
  }
}
