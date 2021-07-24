import 'package:backtracking/Modules/customer.dart';
import 'package:backtracking/Screens/Manager/viewOrders.dart';
import 'package:backtracking/Screens/Welcome/Welcome_Screen.dart';
import 'package:backtracking/providers/customers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomerDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Customers customerProvider = Provider.of<Customers>(context, listen: false);
    Customer currentCustomer = customerProvider.getCurrentCustomer();

    return Drawer(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).primaryColor,
                  Colors.purple[200],
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            padding: EdgeInsets.only(
              top: 35,
              left: 15,
            ),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 65,
                  width: 65,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(currentCustomer.imageUrl),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Text(
                    currentCustomer.customer_name,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Text(
                    currentCustomer.email,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[350],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
              dense: true,
              leading: Icon(Icons.shopping_cart),
              title: Text('Orders'),
              onTap: () {
                customerProvider.fetchandSetOrders().then((value) {
                  Navigator.of(context).pushNamed(
                    ViewOrdersScreen.routeName,
                    arguments: customerProvider.myOrders,
                  );
                });
              }),
          Divider(),
          ListTile(
            dense: true,
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => Navigator.of(context).pushReplacementNamed(
              WelcomeScreen.routeName,
            ),
          ),
        ],
      ),
    );
  }
}
