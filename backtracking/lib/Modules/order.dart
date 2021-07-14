import 'package:flutter/foundation.dart';
import 'package:location/location.dart';

class Order {
  @required
  final String id;
  @required
  final int quantity;
  @required
  final String customer_id;
  @required
  final String inventory_id;
  @required
  String status;
  @required
  final DateTime orderDate;
  @required
  final int cost;
  Location location;

  Order(
      {this.id,
      this.location,
      this.quantity,
      this.status,
      this.orderDate,
      this.inventory_id,
      this.customer_id,
      this.cost});
}
