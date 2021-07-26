import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';

import '../Modules/order.dart';
import '../api/api.dart';

class Orders with ChangeNotifier {
  List<Order> _list = [];
  Order _loadedOrderToDeliver;

  Future<void> fetchandSetData(String path) async {
    final response = await CallApi().getData(path);
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
    print(_list);
    notifyListeners();
  }

  void fetchOrderToDriver() {
    _loadedOrderToDeliver = _list.firstWhere(
        (element) => element.status == "on way",
        orElse: () => null);
  }

  // Future<void> fetchOrderToDriver(String Empolyee_id) async {
  //   final response =
  //       await CallApi().getData("employees/${Empolyee_id}/crrunt_orders");
  //   final extractedData = json.decode(response.body) as Map<String, dynamic>;

  //   if (extractedData["message"] == null) {
  //     final Order loadedORder = Order(
  //       id: extractedData["id"].toString(),
  //       orderDate: DateTime.parse(extractedData["date"]).add(
  //         Duration(hours: 2),
  //       ),
  //       cost: extractedData['total_cost'],
  //       status: extractedData['stauts'],
  //       customer_id: extractedData['customer_id'].toString(),
  //       inventory_id: extractedData['inventory_id'].toString(),
  //       employee_id: extractedData['employee_id'].toString(),
  //       car_id: extractedData['car_id'].toString(),
  //       quantity: 20,
  //     );
  //     _loadedOrderToDeliver = loadedORder;
  //     notifyListeners();
  //   }
  // }

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
