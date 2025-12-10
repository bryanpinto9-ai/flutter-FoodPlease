import 'package:flutter/material.dart';
import '../models/product.dart';
import '../models/cart_item.dart';
import '../models/order.dart';
import '../models/app_user.dart';

class AppDataProvider extends ChangeNotifier {
  // Current User
  AppUser? _currentUser;
  AppUser? get currentUser => _currentUser;

  // Products
  List<Product> _products = [
    Product(
      id: '1',
      name: 'Hamburguesa Clásica',
      description: 'Deliciosa carne 100% vacuno con lechuga fresca, tomate, queso cheddar y nuestra salsa especial de la casa.',
      price: 8.50,
      stock: 100,
    ),
    Product(
      id: '2',
      name: 'Pizzeta',
      description: 'Masa madre crocante con salsa de tomate casera y mozzarella.',
      price: 10.00,
      stock: 50,
    ),
    Product(
      id: '3',
      name: 'Ensalada César',
      description: 'Lechuga romana, crutones, parmesano y aderezo césar clásico.',
      price: 7.00,
      stock: 30,
    ),
  ];

  List<Product> get products => _products;

  // Cart
  List<CartItem> _cart = [];
  List<CartItem> get cart => _cart;

  double get cartTotal => _cart.fold(0, (sum, item) => sum + item.total);

  // Orders
  List<Order> _orders = [
    Order(
      id: '1234',
      userId: 'client1',
      customerName: 'Juan Pérez',
      address: 'Calle Falsa 123',
      items: [],
      total: 10.50,
      status: OrderStatus.preparing,
      createdAt: DateTime.now().subtract(const Duration(minutes: 30)),
    ),
     Order(
      id: '1235',
      userId: 'client2',
      customerName: 'Ana Gomez',
      address: 'Av. Libertador 4500, 3B',
      items: [
         // Dummy items for display
      ],
      total: 12.00,
      status: OrderStatus.onWay,
      createdAt: DateTime.now().subtract(const Duration(minutes: 45)),
    ),
      Order(
      id: '1238',
      userId: 'client3',
      customerName: 'Carlos Ruiz',
      address: 'Calle 5 esq. 4',
      items: [],
      total: 8.00,
      status: OrderStatus.pending, // 'Listo Para Retirar' in UI but mapping to pending or making a new status
      createdAt: DateTime.now().subtract(const Duration(hours: 1)),
    ),
  ];
  List<Order> get orders => _orders;

  // --- Actions ---

  void login(String email) {
    if (email.contains('admin') || email.contains('owner') || email.contains('dueño')) {
      _currentUser = AppUser(email: email, name: 'Dueño', role: UserRole.owner);
    } else if (email.contains('delivery') || email.contains('repartidor')) {
       _currentUser = AppUser(email: email, name: 'Repartidor', role: UserRole.delivery);
    } else {
       _currentUser = AppUser(email: email, name: 'Cliente', role: UserRole.client);
    }
    notifyListeners();
  }

  void logout() {
    _currentUser = null;
    _cart = [];
    notifyListeners();
  }

  void addToCart(Product product, int quantity) {
    int index = _cart.indexWhere((item) => item.product.id == product.id);
    if (index >= 0) {
      _cart[index].quantity += quantity;
    } else {
      _cart.add(CartItem(product: product, quantity: quantity));
    }
    notifyListeners();
  }

  void removeFromCart(String productId) {
    _cart.removeWhere((item) => item.product.id == productId);
    notifyListeners();
  }
  
  void clearCart() {
      _cart = [];
      notifyListeners();
  }

  void placeOrder(String address) {
    if (_currentUser == null) return;
    
    final newOrder = Order(
      id: DateTime.now().millisecondsSinceEpoch.toString().substring(8), // Simple ID
      userId: _currentUser!.email,
      customerName: _currentUser!.name, // Or from profile
      address: address,
      items: List.from(_cart),
      total: cartTotal,
      status: OrderStatus.pending,
      createdAt: DateTime.now(),
    );

    _orders.add(newOrder);
    _cart = [];
    notifyListeners();
  }
  
  void updateOrderStatus(String orderId, OrderStatus status) {
      int index = _orders.indexWhere((o) => o.id == orderId);
      if (index != -1) {
          final old = _orders[index];
          _orders[index] = Order(
              id: old.id,
              userId: old.userId,
              customerName: old.customerName,
              address: old.address,
              items: old.items,
              total: old.total,
              status: status,
              createdAt: old.createdAt
          );
          notifyListeners();
      }
  }

  // Owner methods
  void addProduct(Product product) {
    _products.add(product);
    notifyListeners();
  }

  void updateProduct(Product product) {
    int index = _products.indexWhere((p) => p.id == product.id);
    if (index != -1) {
      _products[index] = product;
      notifyListeners();
    }
  }
  
  void deleteProduct(String id) {
      _products.removeWhere((p) => p.id == id);
      notifyListeners();
  }
}
