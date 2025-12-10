import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../models/order_model.dart';

class DataProvider with ChangeNotifier {
  List<Product> _products = [
    Product(
      id: 'p1',
      name: 'Hamburguesa Clásica',
      description: 'Deliciosa carne 100% vacuno con lechuga fresca, tomate, queso cheddar y salsa especial.',
      price: 8.50,
      imageUrl: '',
    ),
    Product(
      id: 'p2',
      name: 'Pizzeta',
      description: 'Masa casera, salsa de tomate natural y mucho queso mozzarella.',
      price: 10.00,
      imageUrl: '',
    ),
    Product(
      id: 'p3',
      name: 'Ensalada César',
      description: 'Lechuga romana, crutones, queso parmesano y aderezo César.',
      price: 7.00,
      imageUrl: '',
    ),
  ];

  List<Order> _orders = [
     Order(
       id: '1235',
       customerName: 'Ana Gomez',
       customerAddress: 'Av. Libertador 4500, 3B',
       items: [
         OrderItem(
           product: Product(id: 'p2', name: 'Pizzeta', description: '', price: 10.0, imageUrl: ''), 
           quantity: 1,
         ),
         OrderItem(
           product: Product(id: 'ref', name: 'Refresco', description: '', price: 2.0, imageUrl: ''), 
           quantity: 1,
         ),
       ],
       status: OrderStatus.onTheWay,
     ),
     Order(
       id: '1238',
       customerName: 'Carlos Ruiz',
       customerAddress: 'Calle 5 esq. 4',
       items: [
         OrderItem(
           product: Product(id: 'p1', name: 'Hamburguesa', description: '', price: 8.5, imageUrl: ''), 
           quantity: 2,
         ),
       ],
       status: OrderStatus.ready,
     ),
  ];

  List<Product> get products => _products;
  List<Order> get orders => _orders;

  // Owner methods
  void addProduct(Product product) {
    _products.add(product);
    notifyListeners();
  }
  
  void updateProduct(String id, Product newProduct) {
    final index = _products.indexWhere((p) => p.id == id);
    if (index >= 0) {
      _products[index] = newProduct;
      notifyListeners();
    }
  }

  void deleteProduct(String id) {
    _products.removeWhere((p) => p.id == id);
    notifyListeners();
  }

  // Delivery methods
  void updateOrderStatus(String orderId, OrderStatus newStatus) {
    final orderIndex = _orders.indexWhere((o) => o.id == orderId);
    if (orderIndex >= 0) {
      _orders[orderIndex].status = newStatus;
      notifyListeners();
    }
  }

  // Client methods
  void placeOrder(Order order) {
    _orders.insert(0, order); // Add to top
    notifyListeners();
  }
}
