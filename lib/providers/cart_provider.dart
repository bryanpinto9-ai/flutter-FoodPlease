import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../models/order_model.dart';
// import 'package:uuid/uuid.dart'; // We'll just generate simple IDs for now

class CartProvider with ChangeNotifier {
  List<OrderItem> _items = [];

  List<OrderItem> get items => _items;

  double get totalAmount {
    return _items.fold(0.0, (sum, item) => sum + item.total);
  }

  int get itemCount {
    return _items.fold(0, (sum, item) => sum + item.quantity);
  }

  void addItem(Product product, int quantity) {
    // Check if item already exists
    int index = _items.indexWhere((item) => item.product.id == product.id);
    if (index >= 0) {
      // Update quantity
      _items[index] = OrderItem(
        product: product, 
        quantity: _items[index].quantity + quantity
      );
    } else {
      _items.add(OrderItem(product: product, quantity: quantity));
    }
    notifyListeners();
  }

  void removeSingleItem(String productId) {
    int index = _items.indexWhere((item) => item.product.id == productId);
    if (index >= 0) {
      if (_items[index].quantity > 1) {
         _items[index] = OrderItem(
          product: _items[index].product, 
          quantity: _items[index].quantity - 1
        );
      } else {
        _items.removeAt(index);
      }
      notifyListeners();
    }
  }

  void removeItem(String productId) {
    _items.removeWhere((item) => item.product.id == productId);
    notifyListeners();
  }

  void clearCart() {
    _items = [];
    notifyListeners();
  }
}
