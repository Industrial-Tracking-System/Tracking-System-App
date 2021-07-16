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
    final customer =
        Provider.of<Customers>(context).findCustomerById(myOrder.customer_id);
    final inventory = Provider.of<Inventories>(context)
        .findInventoryByid(myOrder.inventory_id);
    return Scaffold(
      appBar: AppBar(
        title: Text(customer.company_name + " Order"),
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
                  0.4,
              width: double.infinity,
              child: Image.network(
                "https://comps.canstockphoto.com/customer-care-concept-vector-eps-vectors_csp73674631.jpg",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: (size.height -
                        AppBar().preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    0.25,
              ),
              child: Column(children: [
                Container(
                  padding: EdgeInsets.only(
                      top: size.height * 0.04,
                      left: size.height * 0.02,
                      right: size.height * 0.02,
                      bottom: size.height * 0.02),
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Company Name :",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                              Text(customer.company_name,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Quantity:",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                              Text(myOrder.quantity.toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Status:",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                              Text(myOrder.status,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Cost:",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                              Text(myOrder.cost.toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Inventory Name:",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                              Text(inventory.inventory_name,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Order Date:",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                              Text(
                                  DateFormat('yyyy-MM-dd')
                                      .format(myOrder.orderDate),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18)),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: size.width * 0.06),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Estimated Time:",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                            Text(
                                myOrder.orderDate
                                    .difference(DateTime.now())
                                    .toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(75),
                      topRight: Radius.circular(75),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: size.height * 0.39,
                  child: Image.network(
                    "https://media.wired.com/photos/59269cd37034dc5f91bec0f1/master/pass/GoogleMapTA.jpg",
                    fit: BoxFit.cover,
                  ),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
