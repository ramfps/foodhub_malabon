// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/cupertino.dart';
import 'package:collection/collection.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
  });
}

class Cart with ChangeNotifier {
  Map<String, CartItem>? _items = {};

  Map<String, CartItem> get items {
    return {..._items!};
  }

  double get cartTotalAmount {
    double total = 0.0;
    _items?.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  int get itemCount => _items!.values
      .fold(0, (quantity, cartItem) => cartItem.quantity + quantity);

  void addItem(String productId, double price, String title) {
    if (_items!.containsKey(productId)) {
      //change the quantity
      _items!.update(
          productId,
          (existingCartItem) => CartItem(
              id: existingCartItem.id,
              title: existingCartItem.title,
              quantity: existingCartItem.quantity + 1,
              price: price));
    } else {
      _items!.putIfAbsent(
        productId,
        () => CartItem(
            id: DateTime.now().toString(),
            title: title,
            price: price,
            quantity: 1),
      );
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items!.remove((productId));
    notifyListeners();
  }

  void clearCart() {
    _items = {};
    notifyListeners();
  }
}
