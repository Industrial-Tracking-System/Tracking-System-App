import 'package:backtracking/Modules/order.dart';
import 'package:backtracking/Widgets/order_item.dart';
import 'package:flutter/foundation.dart';

class Orders with ChangeNotifier {
  List<Order> _list = [
    Order(
        id: "1",
        companyName: "Al-Shoruk Group",
        status: "on the road",
        quantity: 1500,
        factoryName: "Al-Haram",
        estimatedTime: DateTime.now(),
        orderDate: DateTime.now(),
        factoryLattitude: "100",
        factoryLongtiude: "200"),
    Order(
        id: "2",
        companyName: "Moussa Group",
        status: "on the road",
        quantity: 1500,
        factoryName: "Al-Haram",
        estimatedTime: DateTime.now(),
        orderDate: DateTime.now(),
        factoryLattitude: "100",
        factoryLongtiude: "200"),
    Order(
        id: "3",
        companyName: "Eliot Group",
        status: "on the road",
        quantity: 1500,
        factoryName: "Al-Haram",
        estimatedTime: DateTime.now(),
        orderDate: DateTime.now(),
        factoryLattitude: "100",
        factoryLongtiude: "200"),
    Order(
        id: "4",
        companyName: "Ta7a Group",
        status: "on the road",
        quantity: 1500,
        factoryName: "Al-Haram",
        estimatedTime: DateTime.now(),
        orderDate: DateTime.now(),
        factoryLattitude: "100",
        factoryLongtiude: "200"),
    Order(
        id: "5",
        companyName: "Devil Group",
        status: "on the road",
        quantity: 1500,
        factoryName: "Al-Haram",
        estimatedTime: DateTime.now(),
        orderDate: DateTime.now(),
        factoryLattitude: "100",
        factoryLongtiude: "200")
  ];
  get myOrders {
    return [..._list];
  }

  Order findByid(String id) {
    return _list.firstWhere((order) => order.id == id);
  }
}
