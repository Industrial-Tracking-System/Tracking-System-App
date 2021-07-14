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
    final myOrder = Provider.of<Orders>(context).findByid(orderId);
    return Scaffold(
      appBar: AppBar(
        title: Text(myOrder.companyName + " Order"),
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
              // child: Image.asset(
              //   "assets/images/login_bottom.png",
              //   fit: BoxFit.cover,
              // ),
              child: Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrxQ6QUCj7QIik6HZmgg9pAXNrLVv7Az3DfQ&usqp=CAU",
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              // height: (size.height -
              //             AppBar().preferredSize.height -
              //             MediaQuery.of(context).padding.top) *
              //         0.4,
              top: (size.height -
                      AppBar().preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  0.2,
              child: Container(
                  
                  height: (size.height -
                          AppBar().preferredSize.height -
                          MediaQuery.of(context).padding.top) *
                      0.8,
                  width: double.infinity,
                  padding: EdgeInsets.only(
                    left: size.width * 0.04,
                    // right: size.width * 0.04,
                    top: size.height * 0.05,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Company Name: ${myOrder.companyName}",
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
                        "Order Date: ${DateFormat('yyyy-MM-dd – kk:mm').format(myOrder.orderDate) }",
                        style: TextStyle(fontSize: 15),
                      ),
                      Text(
                        "Estimated Time: ${myOrder.orderDate.difference(DateTime.now()).inDays } days",
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
                          topRight: Radius.circular(75)))),
            )
          ],
        ),
      ),
    );
  }
}
