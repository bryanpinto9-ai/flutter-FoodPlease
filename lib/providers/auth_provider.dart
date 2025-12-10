import 'package:flutter/material.dart';
import '../models/user_model.dart';

class AuthProvider with ChangeNotifier {
  User? _currentUser;

  User? get currentUser => _currentUser;
  bool get isAuthenticated => _currentUser != null;

  void login(String email, String password) {
    // Mock login logic based on email pattern matching
    UserRole role = UserRole.client;
    String name = 'Cliente';

    final lowerEmail = email.toLowerCase();

    if (lowerEmail.contains('owner') || lowerEmail.contains('admin') || lowerEmail.contains('dueño')) {
      role = UserRole.owner;
      name = 'Dueño';
    } else if (lowerEmail.contains('delivery') || lowerEmail.contains('repartidor')) {
      role = UserRole.delivery;
      name = 'Repartidor';
    }

    _currentUser = User(
      id: 'u_${DateTime.now().millisecondsSinceEpoch}',
      email: email,
      name: name,
      role: role,
    );
    notifyListeners();
  }

  void logout() {
    _currentUser = null;
    notifyListeners();
  }
}
