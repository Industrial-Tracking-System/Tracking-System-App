import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../Modules/order.dart';
import '../api/api.dart';

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

  Future<void> fetchandSetData() async {
    final response = await CallApi().getData("all_orders");
    final extractedData = json.decode(response.body) as List<dynamic>;
    final List<Order> loadedProducts = [];
    // print(extractedData);
    for (var i = 0; i < extractedData.length; i++) {
      loadedProducts.add(
        Order(
          id: extractedData[i]["id"],
          status: extractedData[i]['status'],
          customer_id: extractedData[i]['customer_id'],
          inventory_id: extractedData[i]['inventory_id'],
          cost: extractedData[i]['total_cost'],
          quantity: 20,
          orderDate: DateTime.parse(extractedData[i]['date']).add(
            Duration(hours: 2),
          ),
        ),
      );
    }

    _list = loadedProducts;
    notifyListeners();
  }

  get myOrders {
    return [..._list];
  }

  Order findOrderByid(String id) {
    return _list.firstWhere((order) => order.id == id);
    // final response = await CallApi().getData("orders/$id");

  }
}
