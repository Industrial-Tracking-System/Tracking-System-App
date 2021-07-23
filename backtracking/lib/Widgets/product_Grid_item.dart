import 'package:backtracking/Modules/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/cart.dart';

class ProductGridItem extends StatelessWidget {
  final Product currentProduct;

  ProductGridItem(this.currentProduct);
  TextEditingController _quantityController = TextEditingController();

  Future<int> createInputDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("How many do you want?"),
            content: TextField(
              controller: _quantityController,
              keyboardType: TextInputType.number,
            ),
            actions: [
              MaterialButton(
                elevation: 5,
                child: Text("Confirm"),
                onPressed: () {
                  Navigator.of(context)
                      .pop(int.parse(_quantityController.text));
                },
              ),
              MaterialButton(
                elevation: 5,
                child: Text("Undo"),
                onPressed: () {
                  Navigator.of(context).pop(null);
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {},
          child: FadeInImage(
            placeholder: AssetImage('assets/images/product-placeholder.png'),
            image: NetworkImage(currentProduct.imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          leading: IconButton(
            icon: Icon(
              Icons.favorite_border,
            ),
            onPressed: () {},
            color: Theme.of(context).accentColor,
          ),
          backgroundColor: Colors.black87,
          title: Text(
            currentProduct.name,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              createInputDialog(context).then((quantity) {
                if (quantity != null) {
                  cart.addItem(currentProduct.id, currentProduct.price,
                      currentProduct.name, quantity);
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Added item to Cart!"),
                    duration: Duration(seconds: 2),
                    action: SnackBarAction(
                      label: "Undo",
                      onPressed: () {
                        cart.removeSingleItem(currentProduct.id);
                      },
                    ),
                  ));
                  _quantityController.text = "";
                }
              });
            },
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
    );
  }
}
