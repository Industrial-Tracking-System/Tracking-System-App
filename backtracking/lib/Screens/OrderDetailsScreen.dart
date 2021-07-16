import 'package:backtracking/providers/customers.dart';
import 'package:backtracking/providers/inventories.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../providers/Orders.dart';

class OrderDetailsScreen extends StatelessWidget {
  static const routename = "OrderDetailsScreen";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final orderId = ModalRoute.of(context).settings.arguments as String;
    final myOrder = Provider.of<Orders>(context).findOrderByid(orderId);
    final customer = Provider.of<Customers>(context).findCustomerById(myOrder.customer_id);
    final inventory = Provider.of<Inventories>(context).findInventoryByid(myOrder.inventory_id);
    return Scaffold(
      appBar: AppBar(
        title: Text(
            customer.company_name +
                " Order"),
      ),
      body: Container(
        height: size.height -
            AppBar().preferredSize.height -
            MediaQuery.of(context).padding.top,
        child: Stack(
          children: [
            Container(
              height: (size.height -
                      AppBar().preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  0.3,
              width: double.infinity,
              child: Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrxQ6QUCj7QIik6HZmgg9pAXNrLVv7Az3DfQ&usqp=CAU",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: (size.height -
                        AppBar().preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    0.2,
              ),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.only(
                  left: size.width * 0.04,
                  top: size.height * 0.05,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Company Name: ${customer.company_name}",
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      "Quantity: ${myOrder.quantity}",
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      "Status: ${myOrder.status}",
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      "Cost: ${myOrder.cost} \$",
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      "Inventory Name: ${inventory.inventory_name}",
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      "Order Date: ${DateFormat('yyyy-MM-dd').format(myOrder.orderDate)}",
                      style: TextStyle(fontSize: 15),
                    ),
                    Text(
                      "Estimated Time: ${myOrder.orderDate.difference(DateTime.now()).inDays} days",
                      style: TextStyle(fontSize: 15),
                    ),
                    Container(
                      width: double.infinity,
                      height: size.height * 0.35,
                      child: Image.network(
                        "https://media.wired.com/photos/59269cd37034dc5f91bec0f1/master/pass/GoogleMapTA.jpg",
                      ),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(75),
                    topRight: Radius.circular(75),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
