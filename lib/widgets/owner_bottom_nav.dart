import 'package:flutter/material.dart';

class OwnerBottomNav extends StatelessWidget {
  final int selectedIndex;
  
  const OwnerBottomNav({Key? key, required this.selectedIndex}) : super(key: key);

  void _onItemTapped(BuildContext context, int index) {
    if (index == selectedIndex) return;

    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/owner-dashboard');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/owner-products');
        break;
      case 2:
        // Settings/Profile
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
           BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Dash'),
           BottomNavigationBarItem(icon: Icon(Icons.inventory_2), label: 'Prods'),
           BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Ajustes'),
        ],
      ),
    );
  }
}
