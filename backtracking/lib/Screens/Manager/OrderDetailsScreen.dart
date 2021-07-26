import 'package:backtracking/Modules/Inventory.dart';
import 'package:backtracking/Modules/customer.dart';
import 'package:backtracking/Modules/order.dart';
import 'package:backtracking/providers/Employees.dart';
import 'package:backtracking/providers/customers.dart';
import 'package:backtracking/providers/inventories.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../../providers/Orders.dart';

class OrderDetailsScreen extends StatefulWidget {
  static const routename = "OrderDetailsScreen";

  @override
  _OrderDetailsScreenState createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  Order myOrder;
  Customer customer;
  Inventory inventory;
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final arguments = ModalRoute.of(context).settings.arguments as List;
    final orderId = arguments[0];
    final isClient = arguments[1];
    Customers customersProvider =
        Provider.of<Customers>(context, listen: false);

    if (!isClient) {
      if (isLoading) {
        Employees employeesProvider = Provider.of(context, listen: false);
        myOrder =
            Provider.of<Orders>(context, listen: false).findOrderByid(orderId);
        // load data for Manager
        if (employeesProvider.getCurrentEmployeeData.isManger == 1) {
          print("hello manager");
          customer = Provider.of<Customers>(context, listen: false)
              .findCustomerById(myOrder.customer_id);
          inventory = Provider.of<Inventories>(context, listen: false)
              .findInventoryByid(myOrder.inventory_id);

          setState(() {
            isLoading = false;
          });
        } else {
          // load data for Driver

          customersProvider.fetchCustomer(myOrder.customer_id).then((value) {
            customer = customersProvider.getCurrentCustomer();
          });
          Inventories inventoryProvider =
              Provider.of<Inventories>(context, listen: false);
          inventoryProvider.fetchInventory(myOrder.inventory_id).then((value) {
            inventory = inventoryProvider.getCurrentInventory();
            setState(() {
              isLoading = false;
            });
          });
        }
      }
    } else {
      // load data for customer
      if (isLoading) {
        customersProvider = Provider.of<Customers>(context, listen: false);
        myOrder = customersProvider.findOrderById(orderId);
        customer = customersProvider.getCurrentCustomer();
        Inventories inventoryProvider =
            Provider.of<Inventories>(context, listen: false);
        inventoryProvider.fetchInventory(myOrder.inventory_id).then((value) {
          inventory = inventoryProvider.getCurrentInventory();
          setState(() {
            isLoading = false;
          });
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(customer.company_name + " Order"),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
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
                          0.35,
                    ),
                    child: Column(children: [
                      Container(
                        height:
                            isClient ? size.height * 0.35 : size.height * 0.573,
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
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                  Text(
                                      myOrder.orderDate
                                          .add(Duration(days: 2))
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
                      isClient
                          ? myOrder.status == "Wating Confrimation"
                              ? Container(
                                  margin: EdgeInsets.symmetric(
                                      vertical: size.height * 0.03),
                                  child: ElevatedButton(
                                      child: Text(
                                        "Confirm ",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                          primary:
                                              Theme.of(context).primaryColor,
                                          shape: CircleBorder(
                                              side: BorderSide(
                                                  color: Colors.black)),
                                          padding: EdgeInsets.symmetric(
                                              vertical: size.height * 0.07,
                                              horizontal: size.width * 0.07)),
                                      onPressed: () async {
                                        await customersProvider
                                            .confiremOrder(orderId.toString());
                                      }),
                                )
                              : Container(
                                  color: Theme.of(context).primaryColor,
                                )
                          : Container()
                      // Container(
                      //   width: double.infinity,
                      //   height: size.height * 0.39,
                      //   child: Image.network(
                      //     "https://media.wired.com/photos/59269cd37034dc5f91bec0f1/master/pass/GoogleMapTA.jpg",
                      //     fit: BoxFit.cover,
                      //   ),
                      // )
                    ]),
                  )
                ],
              ),
            ),
    );
  }
}
