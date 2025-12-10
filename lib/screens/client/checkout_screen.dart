import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/cart_provider.dart';
import '../../providers/data_provider.dart';
import '../../models/order_model.dart';
import 'order_status_screen.dart'; // Ensure this matches stub/file name

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String _selectedAddressType = '';
  final _addressController = TextEditingController();
  String _selectedPayment = 'credit';

  void _onAddressTypeChanged(String? val) {
    setState(() {
      _selectedAddressType = val!;
      if (val == 'home') {
        _addressController.text = 'Av. Siempre Viva 742';
      } else if (val == 'work') {
        _addressController.text = 'Calle Falsa 123, Of. 4B';
      } else if (val == 'other') {
        _addressController.text = '';
      }
    });
  }

  void _confirmOrder() {
    if (_addressController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Ingrese una dirección')));
      return;
    }

    final cart = Provider.of<CartProvider>(context, listen: false);
    final data = Provider.of<DataProvider>(context, listen: false);

    // Create Order
    final newOrder = Order(
      id: DateTime.now().millisecondsSinceEpoch.toString(), // Mock ID
      customerName: 'Cliente Demo', // Should come from AuthProvider
      customerAddress: _addressController.text,
      items: List.from(cart.items),
      status: OrderStatus.received,
    );

    // Save Order
    data.placeOrder(newOrder);

    // Clear Cart
    cart.clearCart();

    // Navigate to Status
    Navigator.pushAndRemoveUntil(
      context, 
      MaterialPageRoute(builder: (_) => const OrderStatusScreen()), 
      (route) => false // Remove all history so user can't go back to checkout
    );
     // Note: OrderStatusScreen usually has bottom nav back to home, so we might need a wrapper or just pushReplacement. 
     // pushAndRemoveUntil is fine if OrderStatusScreen has the bottom nav.
  }

  @override
  Widget build(BuildContext context) {
    final total = Provider.of<CartProvider>(context).totalAmount;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirmar'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: const Color(0xFF2c2c2c),
      ),
      body: SingleChildScrollView(
         padding: const EdgeInsets.all(24),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.stretch,
           children: [
             // Address
             const Text('Dirección de entrega', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
             const SizedBox(height: 8),
             Container(
               padding: const EdgeInsets.symmetric(horizontal: 12),
               decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: const Color(0xFF2c2c2c), width: 2),
               ),
               child: DropdownButtonHideUnderline(
                 child: DropdownButton<String>(
                   value: _selectedAddressType.isEmpty ? null : _selectedAddressType,
                   hint: const Text('Seleccionar guardada...'),
                   isExpanded: true,
                   onChanged: _onAddressTypeChanged,
                   items: const [
                     DropdownMenuItem(value: 'home', child: Text('Casa (Av. Siempre Viva 742)')),
                     DropdownMenuItem(value: 'work', child: Text('Trabajo (Calle Falsa 123)')),
                     DropdownMenuItem(value: 'other', child: Text('Otra dirección...')),
                   ],
                 ),
               ),
             ),
             const SizedBox(height: 8),
             TextField(
               controller: _addressController,
               maxLines: 3,
               decoration: const InputDecoration(hintText: 'Ej: Calle Falsa 123, Depto 4...'),
             ),
             
             const SizedBox(height: 16),
             
             // Payment
             const Text('Método de Pago', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
             const SizedBox(height: 8),
             Container(
               padding: const EdgeInsets.symmetric(horizontal: 12),
               decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: const Color(0xFF2c2c2c), width: 2),
               ),
               child: DropdownButtonHideUnderline(
                 child: DropdownButton<String>(
                   value: _selectedPayment,
                   isExpanded: true,
                   onChanged: (val) => setState(() => _selectedPayment = val!),
                   items: const [
                     DropdownMenuItem(value: 'credit', child: Text('Tarjeta de Crédito (**** 1234)')),
                     DropdownMenuItem(value: 'cash', child: Text('Efectivo con entrega')),
                     DropdownMenuItem(value: 'paypal', child: Text('Paypal')),
                   ],
                 ),
               ),
             ),
             
             const SizedBox(height: 24),
             
             // Summary
             Container(
               padding: const EdgeInsets.all(16),
               decoration: BoxDecoration(
                 color: const Color(0xFFf0fdf4), // Light green
                 border: Border.all(color: const Color(0xFFbbf7d0)),
                 borderRadius: BorderRadius.circular(8),
               ),
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   const Text('Resumen', style: TextStyle(color: Color(0xFF15803d), fontSize: 14)),
                   const SizedBox(height: 4),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       const Text('Total a Pagar', style: TextStyle(fontWeight: FontWeight.bold)),
                       Text('\$${total.toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.bold)),
                     ],
                   )
                 ],
               ),
             ),
             
             const SizedBox(height: 32),
             ElevatedButton(
               onPressed: _confirmOrder,
               child: const Text('Confirmar Pedido'),
             )
           ],
         ),
      ),
    );
  }
}
