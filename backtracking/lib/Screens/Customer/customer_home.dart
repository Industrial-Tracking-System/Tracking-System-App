import 'package:backtracking/Screens/Customer/cart_screen.dart';
import 'package:backtracking/Widgets/badge.dart';
import 'package:backtracking/Widgets/products_grid.dart';
import 'package:backtracking/providers/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'customer_drawer.dart';

class CustomerHomePage extends StatelessWidget {
  static const routeName = "/customer-home-screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
        actions: [
          Consumer<Cart>(
            builder: (context, cart, outerChild) => Badge(
              child: outerChild,
              value: cart.itemCount.toString(),
              color: Colors.black,
            ),
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, CartScreen.routeName);
              },
              icon: Icon(
                Icons.shopping_cart,
              ),
            ),
          ),
        ],
      ),
      drawer: CustomerDrawer(),
      body: ProductsGrid(),
    );
  }
}
