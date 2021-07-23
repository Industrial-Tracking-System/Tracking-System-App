import 'package:flutter/cupertino.dart';

import '../Modules/product.dart';
import 'dart:convert';
import '../api/api.dart';

class Products with ChangeNotifier {
  List<Product> _list = [];

  Future<void> fetchandSetData() async {
    final response = await CallApi().getData("products");
    final extractedData = json.decode(response.body) as List<dynamic>;
    final List<Product> loadedProducts = [];

    for (var i = 0; i < extractedData.length; i++) {
      loadedProducts.add(
        Product(
            price: extractedData[i]["cost"].toDouble(),
            id: extractedData[i]["category_id"].toString(),
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
