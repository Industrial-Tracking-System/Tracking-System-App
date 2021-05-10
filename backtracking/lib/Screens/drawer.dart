import 'package:backtracking/Screens/home.dart';
import 'package:backtracking/Screens/production.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text("BackTracking"),
            automaticallyImplyLeading: false, // never display back buttom
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
            },
          ),
          Divider(),
          ListTile(
              leading: Icon(Icons.query_builder),
              title: Text('Production'),
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(ProductionScreen.routeName);
              }),
          Divider(),
          ListTile(
            leading: Icon(Icons.store),
            title: Text('Stores'),
            onTap: () {},
          ),
          Divider(),
          ListTile(
              leading: Icon(Icons.chat), title: Text('Chat'), onTap: () {}),
          Divider(),
          ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('Orders'),
              onTap: () {}),
          Divider(),
          ListTile(
              leading: Icon(Icons.person),
              title: Text('Clients'),
              onTap: () {}),
          Divider(),
          ListTile(
              leading: Icon(Icons.analytics),
              title: Text('Analysis'),
              onTap: () {}),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
