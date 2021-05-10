import 'package:flutter/cupertino.dart';

import '../Modules/product.dart';

class Products with ChangeNotifier {
  List<Product> _list = [
    Product(
        imageUrl:
            "https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg",
        id: "1",
        start: DateTime.now(),
        end: DateTime.now(),
        name: "OIL",
        quntity: 100),
    Product(
        imageUrl:
            "https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg",
        id: "2",
        start: DateTime.now(),
        end: DateTime.now(),
        name: "Varus",
        quntity: 200),
    Product(
        imageUrl:
            "https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg",
        id: "3",
        start: DateTime.now(),
        end: DateTime.now(),
        name: "Maxxx",
        quntity: 300),
    Product(
        imageUrl:
            "https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg",
        id: "1",
        start: DateTime.now(),
        end: DateTime.now(),
        name: "OIL",
        quntity: 400),
    Product(
        imageUrl:
            "https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg",
        id: "1",
        start: DateTime.now(),
        end: DateTime.now(),
        name: "OIL",
        quntity: 500),
    Product(
        imageUrl:
            "https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg",
        id: "1",
        start: DateTime.now(),
        end: DateTime.now(),
        name: "OIL",
        quntity: 600),
    Product(
        imageUrl:
            "https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg",
        id: "1",
        start: DateTime.now(),
        end: DateTime.now(),
        name: "OIL",
        quntity: 100),
    Product(
        imageUrl:
            "https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg",
        id: "1",
        start: DateTime.now(),
        end: DateTime.now(),
        name: "OIL",
        quntity: 100)
  ];
  get myProducts {
    return [..._list];
  }

  get totalQuntity {
    int sum = 0;
    _list.forEach((element) {
      sum += element.quntity;
    });
    return sum;
  }
}
