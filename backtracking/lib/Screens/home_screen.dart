import 'package:backtracking/Module/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Module/products.dart';
import '../Module/Product_item.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final myProducts = Provider.of<Products>(context, listen: false).myProducts
        as List<Product>;
    return Scaffold(
        appBar: AppBar(
          title: Text("Home Screen"),
          actions: [Icon(Icons.notification_important)],
        ),
        body: ListView.builder(
          itemCount: myProducts.length,
          itemBuilder: (context, index) {
            return ProductItem(
              id: myProducts[index].id,
              start: myProducts[index].start,
              quntity: myProducts[index].quntity,
              end: myProducts[index].end,
              name: myProducts[index].name,
            );
          },
        ));
  }
}
