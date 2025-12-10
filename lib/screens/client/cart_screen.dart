import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/cart_provider.dart';
import '../../widgets/client_bottom_nav.dart';
import 'checkout_screen.dart'; // Need to create this

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrito'),
        automaticallyImplyLeading: false, // Hide back button as we use BottomNav
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: const Color(0xFF2c2c2c),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: cart.items.length,
              itemBuilder: (context, index) {
                final item = cart.items[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(12),
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
                            Text(item.product.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                            Text('\$${item.product.price.toStringAsFixed(2)}', style: const TextStyle(color: Colors.grey)),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove_circle_outline, color: Color(0xFF2c2c2c)),
                            onPressed: () {
                              cart.removeSingleItem(item.product.id);
                            },
                          ),
                          Text('${item.quantity}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          IconButton(
                            icon: const Icon(Icons.add_circle_outline, color: Color(0xFF2c2c2c)),
                            onPressed: () {
                              cart.addItem(item.product, 1);
                            },
                          ),
                        ],
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete_outline, color: Colors.red),
                        onPressed: () {
                          cart.removeItem(item.product.id);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: Color(0xFF2c2c2c), width: 2)),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Total', style: TextStyle(fontSize: 22)),
                    Text('\$${cart.totalAmount.toStringAsFixed(2)}', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: cart.items.isEmpty ? null : () {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(builder: (_) => const CheckoutScreen()), // Create stub
                      );
                    },
                    child: const Text('Realizar Pedido'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const ClientBottomNav(selectedIndex: 1),
    );
  }
}
