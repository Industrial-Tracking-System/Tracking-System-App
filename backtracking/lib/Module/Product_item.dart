import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ProductItem extends StatelessWidget {
  String name;
  @required
  int quntity;
  @required
  DateTime start;
  @required
  DateTime end;
  @required
  String id;

  ProductItem({this.name, this.quntity, this.start, this.id, this.end});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Name:",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(
                "${name}",
                style: Theme.of(context).textTheme.bodyText2,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Qunatity :",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(
                "${quntity}",
                style: Theme.of(context).textTheme.bodyText2,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Start:",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(
                "${DateFormat('hh:mm a').format(start)}",
                style: Theme.of(context).textTheme.bodyText2,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "End",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(
                "${DateFormat('hh:mm a').format(end)}",
                style: Theme.of(context).textTheme.bodyText2,
              )
            ],
          ),
        ],
      ),
    );
  }
}
