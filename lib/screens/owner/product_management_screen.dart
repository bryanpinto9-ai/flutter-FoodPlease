import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/data_provider.dart';
import '../../widgets/owner_bottom_nav.dart';
import 'edit_product_screen.dart'; // Ensure import

class ProductManagementScreen extends StatelessWidget {
  const ProductManagementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<DataProvider>(context).products;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Productos'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        foregroundColor: const Color(0xFF2c2c2c),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => Navigator.pushNamed(context, '/owner-edit-product'),
          )
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 12),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: const Color(0xFF2c2c2c)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: ListTile(
              title: Text(product.name, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('\$${product.price}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.blue),
                    onPressed: () {
                       Navigator.push(
                         context, 
                         MaterialPageRoute(builder: (_) => EditProductScreen(product: product)),
                       );
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      Provider.of<DataProvider>(context, listen: false).deleteProduct(product.id);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: const OwnerBottomNav(selectedIndex: 1),
    );
  }
}
