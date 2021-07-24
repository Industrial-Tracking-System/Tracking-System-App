import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';

import '../Modules/order.dart';
import '../api/api.dart';

class Orders with ChangeNotifier {
  List<Order> _list = [];
  Order _loadedOrderToDeliver;

  Future<void> fetchandSetData() async {
    final response = await CallApi().getData("orders");
    final extractedData = json.decode(response.body) as List<dynamic>;
    final List<Order> loadedProducts = [];

    for (var i = 0; i < extractedData.length; i++) {
      loadedProducts.add(
        Order(
          id: extractedData[i]["id"].toString(),
          orderDate: DateTime.parse(extractedData[i]['date']).add(
            Duration(hours: 2),
          ),
          cost: extractedData[i]['total_cost'],
          status: extractedData[i]['stauts'],
          customer_id: extractedData[i]['customer_id'].toString(),
          inventory_id: extractedData[i]['inventory_id'].toString(),
          employee_id: extractedData[i]['employee_id'].toString(),
          car_id: extractedData[i]['car_id'].toString(),
          quantity: 20,
        ),
      );
    }
    _list = loadedProducts;
    notifyListeners();
  }

  Future<void> fetchOrderToDriver(String Empolyee_id) async {
    final response =
        await CallApi().getData("employees/${Empolyee_id}/crrunt_orders");
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    if (extractedData["message"] == null) {
      final Order loadedORder = Order(
        id: extractedData["${Empolyee_id}"]["id"].toString(),
        orderDate: DateTime.parse(extractedData["${Empolyee_id}"]['date']).add(
          Duration(hours: 2),
        ),
        cost: extractedData["${Empolyee_id}"]['total_cost'],
        status: extractedData["${Empolyee_id}"]['stauts'],
        customer_id: extractedData["${Empolyee_id}"]['customer_id'].toString(),
        inventory_id:
            extractedData["${Empolyee_id}"]['inventory_id'].toString(),
        employee_id: extractedData["${Empolyee_id}"]['employee_id'].toString(),
        car_id: extractedData["${Empolyee_id}"]['car_id'].toString(),
        quantity: 20,
      );
      _loadedOrderToDeliver = loadedORder;
      notifyListeners();
    }
  }

  get getcurrentOrderToDeliver {
    return _loadedOrderToDeliver;
  }

  List<Order> findOrdersofInventories(String inventory_id) {
    return _list.where((order) => order.inventory_id == inventory_id).toList();
  }

  List<Order> findOrdersofCustomer(String customer_id) {
    return _list.where((order) => order.customer_id == customer_id).toList();
  }

  get myOrders {
    return [..._list];
  }

  Order findOrderByid(String id) {
    return _list.firstWhere((order) => order.id == id);
  }
}
