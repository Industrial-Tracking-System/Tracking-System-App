import 'package:backtracking/Modules/employee.dart';
import 'package:backtracking/Screens/Welcome/Welcome_Screen.dart';
import 'package:backtracking/Screens/Manager/clientsScreen.dart';
import 'package:backtracking/Screens/Manager/storeScreen.dart';
import 'package:backtracking/providers/Employees.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'production.dart';
import 'orders_Screen.dart';

class ManagerDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Employee employeeData =
        Provider.of<Employees>(context, listen: false).getCurrentEmployeeData;

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
                    backgroundImage: NetworkImage(employeeData.imageUrl),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Text(
                    employeeData.name,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Text(
                    employeeData.email,
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
              leading: Icon(
                Icons.query_builder,
                size: 30,
              ),
              title: Text(
                'Production',
                style: TextStyle(fontSize: 15),
              ),
              onTap: () {
                Navigator.of(context).pushNamed(ProductionScreen.routeName);
              }),
          Divider(),
          SizedBox(
            height: 5,
          ),
          ListTile(
            dense: true,
            leading: Icon(
              Icons.store,
              size: 30,
            ),
            title: Text('Inventories', style: TextStyle(fontSize: 15)),
            onTap: () {
              Navigator.of(context).pushNamed(StoreScreen.routeName);
            },
          ),
          Divider(),
          SizedBox(
            height: 5,
          ),
          ListTile(
            dense: true,
            leading: Icon(
              Icons.shopping_cart,
              size: 30,
            ),
            title: Text('Orders', style: TextStyle(fontSize: 15)),
            onTap: () => Navigator.of(context).pushNamed(
              OrdersScreen.routeName,
            ),
          ),
          Divider(),
          SizedBox(
            height: 5,
          ),
          ListTile(
            dense: true,
            leading: Icon(
              Icons.person,
              size: 30,
            ),
            title: Text('Clients', style: TextStyle(fontSize: 15)),
            onTap: () => Navigator.of(context).pushNamed(
              ClientsScreen.routeName,
            ),
          ),
          Divider(),
          SizedBox(
            height: 5,
          ),
          ListTile(
            dense: true,
            leading: Icon(
              Icons.exit_to_app,
              size: 30,
            ),
            title: Text('Logout', style: TextStyle(fontSize: 15)),
            onTap: () => Navigator.of(context).pushReplacementNamed(
              WelcomeScreen.routeName,
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
