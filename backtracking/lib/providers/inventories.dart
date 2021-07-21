import 'dart:convert';

import 'package:backtracking/Modules/Inventory.dart';
import 'package:backtracking/api/api.dart';
import 'package:flutter/foundation.dart';

class Inventories with ChangeNotifier {
  List<Inventory> _list = [];
  Future<void> fetchandSetData() async {
    final response = await CallApi().getData("inventories");
    final extractedData = json.decode(response.body) as List<dynamic>;
    final List<Inventory> loadedProducts = [];

    for (var i = 0; i < extractedData.length; i++) {
      loadedProducts.add(
        Inventory(
            inventory_id: extractedData[i]["id"].toString(),
            capcity: extractedData[i]["capaicty"],
            empolyee_id: extractedData[i]["employee_id"].toString(),
            factory_id: extractedData[i]["factory_id"].toString(),
            inventory_name: extractedData[i]["location"].toString(),
            location: extractedData[i]["addres"]),
      );
    }

    _list = loadedProducts;
    notifyListeners();
  }

  get myInventores {
    return [..._list];
  }

  Inventory findInventoryByid(String id) {
    return _list.firstWhere((inventory) => inventory.inventory_id == id);
  }
}
