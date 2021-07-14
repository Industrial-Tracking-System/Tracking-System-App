import 'package:location/location.dart';
import 'package:flutter/foundation.dart';

class Inventory {
  @required
  final String inventory_id;
  @required
  final String inventory_name;
  @required
  final Location location;

  Inventory({this.inventory_id, this.inventory_name, this.location});
}
