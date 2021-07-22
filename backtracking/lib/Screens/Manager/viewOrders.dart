import 'package:backtracking/Modules/order.dart';
import 'package:backtracking/components/myCard.dart';
import 'package:backtracking/providers/customers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'OrderDetailsScreen.dart';

class ViewOrdersScreen extends StatelessWidget {
  static const routeName = "view-orders";

  @override
  Widget build(BuildContext context) {
    final List<Order> data = ModalRoute.of(context).settings.arguments;
    final customer = Provider.of<Customers>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          title: Text("Orders"),
        ),
        backgroundColor: Colors.white,
        body: ListView.builder(
          itemBuilder: (context, index) => MyCard(
            imageLink:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrxQ6QUCj7QIik6HZmgg9pAXNrLVv7Az3DfQ&usqp=CAU",
            id: data[index].id,
            routename: OrderDetailsScreen.routename,
            title:
                customer.findCustomerById(data[index].customer_id).company_name,
            subtitle: data[index].status,
          ),
          itemCount: data.length,
        ));
  }
}
