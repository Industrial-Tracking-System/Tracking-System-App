import 'package:backtracking/Modules/Inventory.dart';
import 'package:flutter/foundation.dart';

import 'package:location/location.dart';

class Inventories with ChangeNotifier {
  List<Inventory> _list = [
    Inventory(
        inventory_id: "1", location: new Location(), inventory_name: "El-Haram"),
    Inventory(
        inventory_id: "2", location: new Location(), inventory_name: "Shoubramant"),
    Inventory(
        inventory_id: "3", location: new Location(), inventory_name: "El-Rouda"),
    Inventory(
        inventory_id: "4", location: new Location(), inventory_name: "Helwan ")
  ];

  get myInventores {
    return [..._list];
  }

  Inventory findInventoryByid(String id) {
    return _list.firstWhere((inventory) => inventory.inventory_id == id);
  }
}
