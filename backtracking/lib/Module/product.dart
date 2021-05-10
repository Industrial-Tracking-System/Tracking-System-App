import 'package:flutter/cupertino.dart';

class Product {
  @required
  String name;
  @required
  int quntity;
  @required
  DateTime start;
  @required
  DateTime end;
  @required
  String id;
  @required
  String imageUrl;
  Product(
      {this.name, this.quntity, this.start, this.id, this.end, this.imageUrl});
}
