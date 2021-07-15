import 'package:backtracking/Screens/Welcome/components/Button.dart';
import 'package:backtracking/providers/customers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClientDetailsScreen extends StatelessWidget {
  static const routename = "/Client-Details-Screen";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final customerId = ModalRoute.of(context).settings.arguments as String;
    final customer = Provider.of<Customers>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
            customer.findCustomerById(customerId).company_name + " Company"),
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
              color: Colors.white,
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
                  // left: size.width * 0.04,
                  top: size.height * 0.05,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Company Name: ${customer.findCustomerById(customerId).company_name}",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      Text(
                        "Client Name: ${customer.findCustomerById(customerId).customer_name}",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      Text(
                        "email: ${customer.findCustomerById(customerId).email}",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      Text(
                        "Phone: ${customer.findCustomerById(customerId).phone} \$",
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      Button(
                        color: Colors.white,
                        press: () {},
                        text: "CONTACT",
                        textColor: Theme.of(context).primaryColor,
                      ),
                    ]),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
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
