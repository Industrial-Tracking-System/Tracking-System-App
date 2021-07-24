import 'package:backtracking/Modules/Inventory.dart';
import 'package:backtracking/Modules/order.dart';
import 'package:backtracking/Screens/Manager/ClientDetailsScreen.dart';
import 'package:backtracking/components/myCard.dart';
import 'package:backtracking/providers/customers.dart';
import 'package:backtracking/providers/inventories.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'OrderDetailsScreen.dart';

class ViewOrdersScreen extends StatelessWidget {
  static const routeName = "view-orders";

  @override
  Widget build(BuildContext context) {
    List<dynamic> args = ModalRoute.of(context).settings.arguments;
    final List<Order> data = args[0];
    final bool isClient = args[1];
    String clientName;
    String inventoryName;

    final customer = Provider.of<Customers>(context, listen: false);
    if (isClient) {
      clientName = data.isEmpty
          ? "No"
          : Provider.of<Customers>(context)
              .findCustomerById(data[0].customer_id)
              .company_name;
    } else {
      inventoryName = data.isEmpty
          ? "No"
          : Provider.of<Inventories>(context)
              .findInventoryByid(data[0].inventory_id)
              .inventory_name;
    }

    return Scaffold(
        appBar: AppBar(
          title: isClient
              ? Text(clientName + " ORDERS")
              : Text(inventoryName + " ORDERS"),
        ),
        backgroundColor: Colors.white,
        body: ListView.builder(
          itemBuilder: (context, index) => MyCard(
            imageLink:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrxQ6QUCj7QIik6HZmgg9pAXNrLVv7Az3DfQ&usqp=CAU",
            id: data[index].id,
            routename: OrderDetailsScreen.routename,
            title: customer.getCurrentCustomer() == null
                ? customer
                    .findCustomerById(data[index].customer_id)
                    .company_name
                : customer.getCurrentCustomer().company_name,
            subtitle: data[index].status,
          ),
          itemCount: data.length,
        ));
  }
}
