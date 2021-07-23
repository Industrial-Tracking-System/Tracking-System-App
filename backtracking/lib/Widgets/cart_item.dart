import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String title;

  CartItem({
    this.id,
    this.productId,
    this.price,
    this.quantity,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(productId);
      },
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('Confirm deletion'),
            content: Text("do you want to remove the item from the cart?"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: Text("No"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: Text("Yes"),
              ),
            ],
          ),
        );
      },
      key: ValueKey(id),
      background: Container(
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 30,
        ),
        alignment: Alignment.centerRight,
        color: Theme.of(context).errorColor,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      ),
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              maxRadius: 30,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: FittedBox(child: Text("\$$price")),
              ),
            ),
            title: Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              "Total: \$${price * quantity}",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            trailing: Text("$quantity x"),
          ),
        ),
      ),
    );
  }
}
