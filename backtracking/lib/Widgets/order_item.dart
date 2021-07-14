import 'package:backtracking/Screens/OrderDetailsScreen.dart';
import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  final String id;
  final String companyName;
  final String inventoryName;
  final int quantity;
  String status;

  OrderItem({
    this.id,
    this.companyName,
    this.inventoryName,
    this.status,
    this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(OrderDetailsScreen.routename, arguments: id);
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        elevation: 10,
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.network(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrxQ6QUCj7QIik6HZmgg9pAXNrLVv7Az3DfQ&usqp=CAU"),
          ),
          title: Text(
            companyName,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            status,
            style: TextStyle(fontSize: 15),
          ),
          trailing: Icon(
            Icons.arrow_right,
            size: 35,
          ),
        ),
      ),
    );
  }
}
