import 'package:backtracking/Modules/customer.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';

class Customers with ChangeNotifier {
  List<Customer> _list = [
    Customer(
      company_name: "Tie",
      customer_id: "1",
      customer_name: "Moussa",
      email: "Moussa@yahoo.com",
      phone: "01157144236",
      location: new Location(),
    ),
    Customer(
      company_name: "Bie",
      customer_id: "2",
      customer_name: "Moussa",
      email: "Moussa@yahoo.com",
      phone: "01157144236",
      location: new Location(),
    ),
    Customer(
      company_name: "Cie",
      customer_id: "3",
      customer_name: "Moussa",
      email: "Moussa@yahoo.com",
      phone: "01157144236",
      location: new Location(),
    ),
    Customer(
      company_name: "Kie",
      customer_id: "4",
      customer_name: "Eliot",
      email: "Eliot@yahoo.com",
      phone: "01157144236",
      location: new Location(),
    )
  ];
  get myCustoemrs {
    return [..._list];
  }

  Customer findCustomerById(String id) {
    return _list.firstWhere((customer) => customer.customer_id == id);
  }
}
