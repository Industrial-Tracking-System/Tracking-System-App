import 'dart:convert';

import 'package:backtracking/Modules/customer.dart';
import 'package:backtracking/api/api.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

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
            location: extractedData[i]["address"],
            phone: extractedData[i]["phone"],
            apitoken: extractedData[i]["api_token"]),
      );
    }

    _list = loadedProducts;
    notifyListeners();
  }

  void setCurrentCustomer(Map<String, dynamic> extractedData) {
    _currentCustomer = Customer(
      company_name: extractedData["company_name"],
      customer_id: extractedData["id"].toString(),
      customer_name: extractedData["name"],
      email: extractedData["email"],
      location: extractedData["address"],
      phone: extractedData["phone"],
      apitoken: extractedData["api_token"],
    );
  }

  Customer getCurrentCustomer(){
    return _currentCustomer;
  }

  get myCustoemrs {
    return [..._list];
  }

  Customer findCustomerById(String id) {
    return _list.firstWhere((customer) => customer.customer_id == id);
  }
}
