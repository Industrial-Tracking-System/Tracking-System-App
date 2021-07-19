import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductItem extends StatelessWidget {
  final String name;
  @required
  final int quntity;
  @required
  final DateTime start;
  @required
  final String id;
  @required
  final String iamgeUrl;

  ProductItem({this.name, this.quntity, this.start, this.id, this.iamgeUrl});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(iamgeUrl),
          radius: 30,
        ),
        title: Text(
          name,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        subtitle: Padding(
          padding: EdgeInsets.only(top: 5),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Created At :",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Text(
                "  ${DateFormat('hh:mm a').format(start)}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        trailing: Text(
          "x" + quntity.toString(),
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
        ));
  }
}
