import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/app_provider.dart';
import '../../theme/sketchy_theme.dart';
import '../../widgets/sketchy_card.dart';

class OwnerProductsScreen extends StatelessWidget {
  const OwnerProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
             // Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              child: Row(
                children: [
                  const SizedBox(width: 40),
                  const Spacer(),
                  Text('Mis Productos', style: SketchyTheme.titleStyle),
                  const Spacer(),
                   IconButton(
                    icon: const Icon(Icons.add, size: 30, color: SketchyTheme.primaryColor),
                    onPressed: () => Navigator.pushNamed(context, '/product-form'),
                  ),
                ],
              ),
            ),
            const Divider(color: SketchyTheme.textPrimary, thickness: 2),

            Expanded(
              child: Consumer<AppDataProvider>(
                builder: (context, provider, child) {
                   return ListView.builder(
                     padding: const EdgeInsets.all(24),
                     itemCount: provider.products.length,
                     itemBuilder: (context, index) {
                       final product = provider.products[index];
                       return Padding(
                         padding: const EdgeInsets.only(bottom: 10),
                         child: SketchyCard(
                           padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Text(product.name, style: SketchyTheme.titleStyle.copyWith(fontSize: 18)),
                                   Text('\$${product.price}', style: SketchyTheme.textStyle.copyWith(color: SketchyTheme.textSecondary)),
                                 ],
                               ),
                               Row(
                                 children: [
                                   TextButton(
                                     onPressed: () {
                                        Navigator.pushNamed(context, '/product-form', arguments: product);
                                     },
                                     child: Text('Edit', style: SketchyTheme.textStyle.copyWith(fontSize: 14)),
                                   ),
                                   TextButton(
                                     onPressed: () {
                                        provider.deleteProduct(product.id);
                                     },
                                     child: Text('X', style: SketchyTheme.textStyle.copyWith(color: Colors.red, fontSize: 14)),
                                   ),
                                 ],
                               ),
                             ],
                           ),
                         ),
                       );
                     },
                   );
                },
              ),
            ),
          ],
        ),
      ),
       bottomNavigationBar: _buildOwnerNav(context, 1),
    );
  }

   Widget _buildOwnerNav(BuildContext context, int currentIndex) {
    return Container(
      height: 80,
      decoration: const BoxDecoration(
        color: SketchyTheme.navBg,
        border: Border(top: BorderSide(color: SketchyTheme.textPrimary, width: 3)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(context, 0, '📊', 'Dash', '/owner-dashboard', currentIndex),
          _buildNavItem(context, 1, '📦', 'Prods', '/owner-products', currentIndex),
          _buildNavItem(context, 2, '⚙️', 'Ajustes', null, currentIndex), 
        ],
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, int index, String icon, String label, String? route, int currentIndex) {
     final bool isSelected = currentIndex == index;
     return GestureDetector(
      onTap: () {
        if (route != null && !isSelected) {
            Navigator.pushReplacementNamed(context, route);
        }
      },
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
