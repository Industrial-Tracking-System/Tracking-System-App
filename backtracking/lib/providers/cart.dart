import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem({
    @required this.id,
    @required this.title,
    @required this.quantity,
    @required this.price,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {
    // "0": CartItem(id: "00", title: "first", quantity: 10, price: 100),
  };

  Map<String, CartItem> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    double sum = 0;
    _items.forEach((key, cart) {
      sum += cart.quantity * cart.price;
    });
    return sum;
  }

  void addItem(String productId, double price, String title, int quantity) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (value) => CartItem(
                id: value.id,
                price: value.price,
                quantity: value.quantity + quantity,
                title: value.title,
              ));
    } else {
      _items.putIfAbsent(
          productId,
          () => CartItem(
              id: DateTime.now().toString(),
              title: title,
              price: price,
              quantity: quantity));
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void removeSingleItem(String productId) {
    if (!_items.containsKey(productId)) {
      return;
    }
    if (_items[productId].quantity > 1) {
      _items.update(
          productId,
          (oLdItem) => CartItem(
                id: oLdItem.id,
                price: oLdItem.price,
                title: oLdItem.title,
                quantity: oLdItem.quantity - 1,
              ));
    } else {
      _items.remove(productId);
    }
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
