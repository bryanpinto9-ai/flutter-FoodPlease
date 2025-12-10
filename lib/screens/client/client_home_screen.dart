import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/data_provider.dart';
import '../../providers/cart_provider.dart';
import '../../providers/auth_provider.dart';
import '../../widgets/client_bottom_nav.dart';
import 'product_detail_screen.dart'; // We need this, but haven't created it yet. I'll include it in this file or stub it? Better to create the file.

class ClientHomeScreen extends StatelessWidget {
  const ClientHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<DataProvider>(context).products;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text('Hola, Cliente', style: TextStyle(color: Color(0xFF2c2c2c), fontWeight: FontWeight.bold)),
        actions: [
          TextButton(
             onPressed: () {
               Provider.of<AuthProvider>(context, listen: false).logout();
               Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
             },
             child: const Text('Salir', style: TextStyle(color: Colors.red)),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(0xFF2c2c2c),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: Column(
                  children: [
                    Text('50% OFF', style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text('En tu primera compra', style: TextStyle(color: Colors.white70, fontSize: 16)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text('Menú', style: TextStyle(fontSize: 24)),
            const SizedBox(height: 16),
            // Product List
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: const Color(0xFF2c2c2c), width: 2),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [BoxShadow(color: Colors.black12, offset: Offset(4, 4))],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(product.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 4),
                            Text('\$${product.price.toStringAsFixed(2)}', style: const TextStyle(color: Colors.grey, fontSize: 16)),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
                        onPressed: () {
                           // Quick add to cart or go to detail? 
                           // Wireframe says "Agregar" -> "screen-product-detail".
                           // But standard UX for "Add" button in list adds to cart usually.
                           // Flow: go to detail.
                           Navigator.push(
                             context,
                             MaterialPageRoute(builder: (_) => ProductDetailScreen(product: product)), // Stub needed
                           );
                        },
                        child: const Text('Agregar'),
                      )
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 80), // Space for bottom nav
          ],
        ),
      ),
      bottomNavigationBar: const ClientBottomNav(selectedIndex: 0),
    );
  }
}
