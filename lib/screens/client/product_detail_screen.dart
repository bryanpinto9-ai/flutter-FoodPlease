import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/product_model.dart';
import '../../providers/cart_provider.dart';

class ProductDetailScreen extends StatefulWidget {
  final Product product;

  const ProductDetailScreen({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int _quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: const Color(0xFF2c2c2c),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Placeholder Image
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFA8E6CF), // Success color
                border: Border.all(color: const Color(0xFF2c2c2c), width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text('Imagen del Producto', style: TextStyle(fontSize: 20)),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text(widget.product.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
                Text('\$${widget.product.price.toStringAsFixed(2)}', style: const TextStyle(fontSize: 24, color: Color(0xFFFF6B6B), fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 16),
            Text(widget.product.description, style: const TextStyle(fontSize: 18)),
            const Spacer(),
            
            // Quantity Selector
            Container(
              padding: const EdgeInsets.all(8),
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () {
                      if (_quantity > 1) {
                        setState(() {
                          _quantity--;
                        });
                      }
                    },
                  ),
                  Text('$_quantity', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        _quantity++;
                      });
                    },
                  ),
                ],
              ),
            ),
            
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Provider.of<CartProvider>(context, listen: false).addItem(widget.product, _quantity);
                  Navigator.pop(context); // Go back to catalogue
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Producto agregado al carrito')),
                  );
                },
                child: const Text('Agregar al Carrito'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
