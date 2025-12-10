import 'package:flutter/material.dart';
import '../theme/sketchy_theme.dart';

class SketchyBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const SketchyBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: const BoxDecoration(
        color: SketchyTheme.navBg,
        border: Border(top: BorderSide(color: SketchyTheme.textPrimary, width: 3)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(0, '🏠', 'Inicio'),
          _buildNavItem(1, '🛒', 'Carrito'),
          _buildNavItem(2, '📦', 'Pedidos'),
        ],
      ),
    );
  }

  Widget _buildNavItem(int index, String icon, String label) {
    final bool isSelected = currentIndex == index;
    return GestureDetector(
      onTap: () => onTap(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            icon,
            style: TextStyle(
              fontSize: 32,
              color: isSelected ? SketchyTheme.accentColor : Colors.grey,
            ),
          ),
          if (isSelected)
            Transform.rotate(
               angle: -0.05,
               child: Text(label, style: const TextStyle(color: SketchyTheme.accentColor, fontSize: 12)),
            ),
        ],
      ),
    );
  }
}
