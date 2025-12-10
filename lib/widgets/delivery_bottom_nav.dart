import 'package:flutter/material.dart';

class DeliveryBottomNav extends StatelessWidget {
  final int selectedIndex;
  
  const DeliveryBottomNav({Key? key, required this.selectedIndex}) : super(key: key);

  void _onItemTapped(BuildContext context, int index) {
    if (index == selectedIndex) return;

    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/delivery-home');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/profile');
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
        backgroundColor: const Color(0xFF222222),
        selectedItemColor: const Color(0xFF4ECDC4),
        unselectedItemColor: Colors.grey,
        currentIndex: selectedIndex,
        onTap: (index) => _onItemTapped(context, index),
        type: BottomNavigationBarType.fixed,
        items: const [
           BottomNavigationBarItem(icon: Icon(Icons.two_wheeler), label: 'Pedidos'),
           BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }
}
