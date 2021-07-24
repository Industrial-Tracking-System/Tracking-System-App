import 'dart:convert';

import 'package:backtracking/Modules/Inventory.dart';
import 'package:backtracking/api/api.dart';
import 'package:flutter/foundation.dart';

class Inventories with ChangeNotifier {
  List<Inventory> _list = [];
  Inventory _currentInventory;
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
        ),
      );
    }

    _list = loadedProducts;
    notifyListeners();
  }

  Future<void> fetchInventory(String inventory_id) async {
    final response = await CallApi().getData("inventories/${inventory_id}");
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    print("Inventory " + response.body);
    final Inventory loadedInventory = Inventory(
      inventory_id: extractedData["id"].toString(),
      capcity: extractedData["capaicty"],
      empolyee_id: extractedData["employee_id"].toString(),
      factory_id: extractedData["factory_id"].toString(),
      inventory_name: extractedData["location"].toString(),
    );
    _currentInventory = loadedInventory;
    notifyListeners();
  }

  Inventory getCurrentInventory() {
    return _currentInventory;
  }

  get myInventores {
    return [..._list];
  }

  Inventory findInventoryByid(String id) {
    return _list.firstWhere((inventory) => inventory.inventory_id == id);
  }
}
