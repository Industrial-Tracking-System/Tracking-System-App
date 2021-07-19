import 'package:flutter/cupertino.dart';

import '../Modules/product.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../api/api.dart';

class Products with ChangeNotifier {
  List<Product> _list = [
    /*Product(
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
        quntity: 100)*/
  ];

  Future<void> fetchandSetData() async {
    final response = await CallApi().getData("products");
    final extractedData = json.decode(response.body) as List<dynamic>;
    final List<Product> loadedProducts = [];
    print(extractedData);
    for (var i = 0; i < extractedData.length; i++) {
      loadedProducts.add(
        Product(
            id: extractedData[i]["id"],
            quntity: extractedData[i]['quantity'],
            name: extractedData[i]['category_name'],
            imageUrl: extractedData[i]['image_path'],
            start: DateTime.parse(extractedData[i]['created_at'])
                .add(Duration(hours: 2))),
      );
    }

    _list = loadedProducts;
    notifyListeners();
  }

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
