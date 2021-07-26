import 'dart:convert';

import 'package:backtracking/Modules/customer.dart';
import 'package:backtracking/Modules/order.dart';
import 'package:backtracking/api/api.dart';
import 'package:flutter/material.dart';

class Customers with ChangeNotifier {
  List<Customer> _list = [];
  Customer _currentCustomer;
  Future<void> fetchandSetData() async {
    final response = await CallApi().getData("customers");
    final extractedData = json.decode(response.body) as List<dynamic>;
    final List<Customer> loadedProducts = [];
    for (var i = 0; i < extractedData.length; i++) {
      loadedProducts.add(
        Customer(
            company_name: extractedData[i]["company_name"],
            customer_id: extractedData[i]["id"].toString(),
            customer_name: extractedData[i]["name"],
            email: extractedData[i]["email"],
            latitude: extractedData[i]["latitude"],
            longtude: extractedData[i]["longitude"],
            phone: extractedData[i]["phone"],
            apitoken: extractedData[i]["api_token"]),
      );
    }

    _list = loadedProducts;
    notifyListeners();
  }

  Future<void> fetchCustomer(String customer_id) async {
    final response = await CallApi().getData("customers/$customer_id");
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    print("Customer  " + response.body);
    final Customer loadedCustomer = Customer(
        company_name: extractedData["company_name"],
        customer_id: extractedData["id"].toString(),
        customer_name: extractedData["name"],
        email: extractedData["email"],
        latitude: extractedData["latitude"],
        longtude: extractedData["longitude"],
        phone: extractedData["phone"],
        apitoken: extractedData["api_token"]);
    _currentCustomer = loadedCustomer;
    notifyListeners();
  }

  void setCurrentCustomer(Map<String, dynamic> extractedData) {
    _currentCustomer = Customer(
        company_name: extractedData["company_name"],
        customer_id: extractedData["id"].toString(),
        customer_name: extractedData["name"],
        email: extractedData["email"],
        latitude: extractedData["latitude"],
        longtude: extractedData["longitude"],
        phone: extractedData["phone"],
        apitoken: extractedData["api_token"],
        imageUrl: extractedData["imageUrl"]);
  }

  Future<void> confiremOrder(String orderId) async {
    await CallApi()
        .postData({"order_id": orderId}, "order_arrived").then((value) {
      print(value.body);
    });
    // print(response.body);
  }

  Customer getCurrentCustomer() {
    return _currentCustomer;
  }

  get myCustoemrs {
    return [..._list];
  }

  Customer findCustomerById(String id) {
    return _list.firstWhere((customer) => customer.customer_id == id);
  }

  Order findOrderById(String id) {
    return _myOrders.firstWhere((order) => order.id == id, orElse: () => null);
  }

  List<Order> _myOrders = [];

  Future<void> fetchandSetOrders() async {
    final response = await CallApi()
        .getData("customers/${_currentCustomer.customer_id}/orders");
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
          quantity: extractedData[i]['quantity'],
        ),
      );
    }

    _myOrders = loadedProducts;
    notifyListeners();
  }

  Future<void> logout() async {
    await CallApi().postData(
        {"id": _currentCustomer.customer_id}, "customer_logout").then((value) {
      print(value.body);
    });
  }

  get myOrders {
    return [..._myOrders];
  }
}
