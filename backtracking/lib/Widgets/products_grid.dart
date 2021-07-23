import 'package:backtracking/Widgets/product_Grid_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';

class ProductsGrid extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<Products>(context).myProducts;

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (ctx, i) => ProductGridItem(products[i]),
      
    );
  }
}
