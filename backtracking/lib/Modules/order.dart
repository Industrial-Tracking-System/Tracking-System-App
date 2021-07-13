import 'package:flutter/foundation.dart';

class Order {
  @required
  final String id;
  @required
  final String companyName;
  @required
  final String factoryName;
  @required
  final int quantity;
  @required
  final String factoryLattitude;
  @required
  final String factoryLongtiude;
  @required
  String status;
  @required
  final DateTime orderDate;
  @required
  DateTime estimatedTime;

  Order({
    this.id,
    this.factoryName,
    this.companyName,
    this.quantity,
    this.factoryLattitude,
    this.factoryLongtiude,
    this.status,
    this.orderDate,
    this.estimatedTime,
  });
}
