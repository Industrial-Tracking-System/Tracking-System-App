import 'package:location/location.dart';

class Order {
  final String id;
  final int quantity;
  final String customer_id;
  final String inventory_id;
  final String employee_id;
  String status;
  final DateTime orderDate;
  final int cost;
  Location location;
  final String car_id;

  Order(
      {this.id,
      this.location,
      this.quantity,
      this.status,
      this.orderDate,
      this.inventory_id,
      this.customer_id,
      this.cost,
      this.employee_id,
      this.car_id});
}
