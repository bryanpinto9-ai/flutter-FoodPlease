import 'package:flutter/material.dart';

class ClientBottomNav extends StatelessWidget {
  final int selectedIndex;
  
  const ClientBottomNav({Key? key, required this.selectedIndex}) : super(key: key);

  void _onItemTapped(BuildContext context, int index) {
    if (index == selectedIndex) return;

    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/client-home');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/cart');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/order-status');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Color(0xFF2c2c2c), width: 3)),
      ),
      child: BottomNavigationBar(
        backgroundColor: const Color(0xFF222222), // Nav bg from css
        selectedItemColor: const Color(0xFF4ECDC4), // Accent
        unselectedItemColor: Colors.grey,
        currentIndex: selectedIndex,
        onTap: (index) => _onItemTapped(context, index),
        type: BottomNavigationBarType.fixed,
        items: const [
           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
           BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Carrito'),
           BottomNavigationBarItem(icon: Icon(Icons.local_shipping), label: 'Pedidos'),
        ],
      ),
    );
  }
}
