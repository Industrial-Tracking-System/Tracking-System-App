import 'package:flutter/cupertino.dart';

import '../Module/product.dart';
import 'package:provider/provider.dart';

class Products with ChangeNotifier {
  List<Product> _list = [
    Product(
        id: "1",
        start: DateTime.now(),
        end: DateTime.now(),
        name: "OIL",
        quntity: 100),
    Product(
        id: "2",
        start: DateTime.now(),
        end: DateTime.now(),
        name: "Varus",
        quntity: 200),
    Product(
        id: "3",
        start: DateTime.now(),
        end: DateTime.now(),
        name: "Maxxx",
        quntity: 300)
  ];
  get myProducts {
    return [..._list];
  }
}
