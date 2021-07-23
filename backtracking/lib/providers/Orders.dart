import 'dart:convert';

import 'package:backtracking/providers/customers.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../Modules/order.dart';
import '../api/api.dart';

import '../providers/cart.dart';

class Orders with ChangeNotifier {


  List<Order> _list = [];

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

  // Future<void> sendOrderTodatabase(List<CartItem> cartProducts) async {
  //   List<String> productsIds;
  //   List<int> productsQuantities;

  //   for (int i = 0; i < cartProducts.length; i++) {
  //     productsIds.add(cartProducts[i].id);
  //     productsQuantities.add(cartProducts[i].quantity);
  //   }

  //   Map<String, dynamic> myOrder = {
  //     "customer_id": "1",
  //     "numOfProducs": cartProducts.length,
  //     "productsIds": productsIds,
  //     "quantites": productsQuantities,
  //   };
  //   await CallApi().postData(myOrder, "make_order");
  // }

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
