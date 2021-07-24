import 'package:backtracking/Modules/order.dart';
import 'package:backtracking/Screens/Employee/driverOrderDetail.dart';
import 'package:backtracking/providers/Orders.dart';
import 'package:backtracking/providers/customers.dart';
import 'package:backtracking/providers/inventories.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'employee_drawer.dart';

class EmployeeHomePage extends StatelessWidget {
  static const routeName = "/employee-home-screen";

  @override
  Widget build(BuildContext context) {
    Order orderToDeliver =
        Provider.of<Orders>(context, listen: false).getcurrentOrderToDeliver;
    String customerName;
    String inventoryName;
    if (orderToDeliver != null) {
      customerName = Provider.of<Customers>(context, listen: false)
          .getCurrentCustomer()
          .company_name;
      inventoryName = Provider.of<Inventories>(context, listen: false)
          .getCurrentInventory()
          .inventory_name;
    }

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("ORDER TO DELIVER"),
      ),
      drawer: EmployeeDrawer(),
      body: orderToDeliver == null
          ? Center(
              child: Container(
                child: Text("NO ORDERS TO DELIVER"),
              ),
            )
          : Container(
              width: double.infinity,
              child: Stack(children: [
                Image.network(
                  "https://cdn.discordapp.com/attachments/866650827380883496/868405332462931988/delivery.jpg",
                  fit: BoxFit.fill,
                  height: double.infinity,
                  width: double.infinity,
                ),
                Container(
                  height: size.height * 0.9,
                  margin: EdgeInsets.symmetric(vertical: size.height * 0.04),
                  padding: EdgeInsets.only(
                      top: size.height * 0.04,
                      left: size.height * 0.03,
                      right: size.height * 0.02,
                      bottom: size.height * 0.02),
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ColumnInOrderToDeliverScreen(
                        first: "COMPANY NAME :",
                        second: customerName,
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      ColumnInOrderToDeliverScreen(
                        first: "QUANTITY: ",
                        second: orderToDeliver.quantity.toString(),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      ColumnInOrderToDeliverScreen(
                        first: "STATUS: ",
                        second: orderToDeliver.status,
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      ColumnInOrderToDeliverScreen(
                        first: "COST:",
                        second: orderToDeliver.cost.toString(),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      ColumnInOrderToDeliverScreen(
                        first: "INVENTORY NAME: ",
                        second: inventoryName,
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      ColumnInOrderToDeliverScreen(
                        first: "ORDER DATE:",
                        second: orderToDeliver.orderDate.toString(),
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      ColumnInOrderToDeliverScreen(
                        first: "ESTIMATED TIME:",
                        second: orderToDeliver.toString(),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.transparent.withOpacity(0.8),
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(40)),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 50,
                  child: ElevatedButton(
                    child: Text(
                      "Start Deliver",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).primaryColor,
                        shape:
                            CircleBorder(side: BorderSide(color: Colors.black)),
                        padding: EdgeInsets.symmetric(
                            vertical: size.height * 0.07,
                            horizontal: size.width * 0.07)),
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(DriverOrderDetail.routeName);
                    },
                  ),
                )
              ]),
            ),
    );
  }
}

class ColumnInOrderToDeliverScreen extends StatelessWidget {
  const ColumnInOrderToDeliverScreen(
      {Key key, @required this.first, @required this.second})
      : super(key: key);

  final String first;
  final String second;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          first,
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
        Text(second,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18)),
      ],
    );
  }
}
