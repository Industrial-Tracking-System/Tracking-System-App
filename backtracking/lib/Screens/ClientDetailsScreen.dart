import 'package:backtracking/Screens/Welcome/components/Button.dart';
import 'package:backtracking/providers/customers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.only(
                  left: size.width * 0.04,
                  top: size.height * 0.05,
                ),
                child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Company Name",
                                style: TextStyle(
                                  fontWeight: FontWeight.w100,
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                customer
                                    .findCustomerById(customerId)
                                    .company_name,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Client Name",
                                style: TextStyle(
                                  fontWeight: FontWeight.w100,
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                customer
                                    .findCustomerById(customerId)
                                    .customer_name,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Email",
                                style: TextStyle(
                                  fontWeight: FontWeight.w100,
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                customer.findCustomerById(customerId).email,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Phone",
                                style: TextStyle(
                                  fontWeight: FontWeight.w100,
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                customer.findCustomerById(customerId).phone,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      // Text(
                      //   "Company Name: ${customer.findCustomerById(customerId).company_name}",
                      //   style: TextStyle(fontSize: 20, color: Colors.white),
                      // ),
                      // SizedBox(
                      //   height: size.height * 0.03,
                      // ),
                      // Text(
                      //   "Client Name: ${customer.findCustomerById(customerId).customer_name}",
                      //   style: TextStyle(fontSize: 20, color: Colors.white),
                      // ),
                      // SizedBox(
                      //   height: size.height * 0.03,
                      // ),
                      // Text(
                      //   "email: ${customer.findCustomerById(customerId).email}",
                      //   style: TextStyle(fontSize: 20, color: Colors.white),
                      // ),
                      // SizedBox(
                      //   height: size.height * 0.03,
                      // ),
                      // Text(
                      //   "Phone: ${customer.findCustomerById(customerId).phone} \$",
                      //   style: TextStyle(fontSize: 20, color: Colors.white),
                      // ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Center(
                        child: Button(
                          color: Colors.white,
                          press: () {},
                          text: "CONTACT",
                          textColor: Theme.of(context).primaryColor,
                          width: size.width * 0.6,
                        ),
                      ),
                      Center(
                        child: Button(
                          color: Color(0xFFF1E6FF),
                          press: () {},
                          text: "View Orders",
                          textColor: Colors.black,
                          width: size.width * 0.6,
                        ),
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
