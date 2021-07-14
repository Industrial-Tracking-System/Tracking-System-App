import 'package:flutter/foundation.dart';

import '../Modules/order.dart';

class Orders with ChangeNotifier {
  List<Order> _list = [
    Order(
        id: "1",
        status: "on the road",
        quantity: 1500,
        orderDate: DateTime.now(),
        cost: 200,
        customer_id: "1",
        inventory_id: "1"),
    Order(
        id: "2",
        status: "Arrived",
        quantity: 1600,
        orderDate: DateTime.now(),
        cost: 300,
        customer_id: "1",
        inventory_id: "1"),
    Order(
        id: "3",
        status: "Still",
        quantity: 2000,
        orderDate: DateTime.now(),
        cost: 400,
        customer_id: "2",
        inventory_id: "2"),
    Order(
        id: "4",
        status: "on the road",
        quantity: 1500,
        orderDate: DateTime.now(),
        cost: 200,
        customer_id: "2",
        inventory_id: "2"),
    Order(
        id: "5",
        status: "on the road",
        quantity: 1500,
        orderDate: DateTime.now(),
        cost: 200,
        customer_id: "3",
        inventory_id: "3"),
    Order(
        id: "6",
        status: "on the road",
        quantity: 1500,
        orderDate: DateTime.now(),
        cost: 200,
        customer_id: "4",
        inventory_id: "4")
  ];
  get myOrders {
    return [..._list];
  }

  Order findOrderByid(String id) {
    return _list.firstWhere((order) => order.id == id);
  }
}
