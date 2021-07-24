import 'package:backtracking/Modules/order.dart';
import 'package:backtracking/Screens/Manager/viewOrders.dart';
import 'package:backtracking/Screens/Welcome/components/Button.dart';
import 'package:backtracking/providers/Orders.dart';

import 'package:backtracking/providers/customers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';

class ClientDetailsScreen extends StatelessWidget {
  static const routename = "/Client-Details-Screen";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final customerId = ModalRoute.of(context).settings.arguments as String;
    final customer =
        Provider.of<Customers>(context).findCustomerById(customerId);
    final customerOrders = Provider.of<Orders>(context, listen: false)
        .findOrdersofCustomer(customerId);

    return Scaffold(
      appBar: AppBar(
        title: Text(customer.company_name + " Company"),
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
              color: Colors.white,
              child: SvgPicture.asset(
                "assets/icons/login.svg",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                top: (size.height -
                        AppBar().preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    0.27,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(75),
                  topRight: Radius.circular(75),
                ),
              ),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.15),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Company Name:",
                            style: TextStyle(
                              fontWeight: FontWeight.w200,
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            customer.company_name,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: size.height * 0.02),
                          Text(
                            "Client Name:",
                            style: TextStyle(
                              fontWeight: FontWeight.w200,
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            customer.customer_name,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: size.height * 0.02),
                          Text(
                            "Email:",
                            style: TextStyle(
                              fontWeight: FontWeight.w200,
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            customer.email,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: size.height * 0.02),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Phone:",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w200,
                                      fontSize: 15,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    customer.phone,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(width: 10),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.025,
                      ),
                      Center(
                        child: Button(
                          color: Colors.white,
                          press: () {
                            launch("tel://<${customer.phone}>");
                          },
                          text: "CONTACT",
                          textColor: Theme.of(context).primaryColor,
                          width: size.width * 0.6,
                        ),
                      ),
                      Center(
                        child: Button(
                          color: Color(0xFFF1E6FF),
                          press: () {
                            Navigator.of(context).pushNamed(
                              ViewOrdersScreen.routeName,
                              arguments: [customerOrders, true],
                            );
                          },
                          text: "View Orders",
                          textColor: Theme.of(context).primaryColor,
                          width: size.width * 0.6,
                        ),
                      ),
                    ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
