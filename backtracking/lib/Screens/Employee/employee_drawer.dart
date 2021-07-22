import 'package:backtracking/Screens/Welcome/Welcome_Screen.dart';
import 'package:flutter/material.dart';

class EmployeeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                    backgroundImage: NetworkImage(
                        "https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Text(
                    "Mohamed Ashraf",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Text(
                    "mohamedelesaily0@gmail.com",
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
            // onTap: () => Navigator.of(context).pushNamed(
            // OrdersScreen.routeName,
            // ),
          ),
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
