import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/order_model.dart';
import '../../providers/data_provider.dart';

class DeliveryDetailScreen extends StatelessWidget {
  final Order? order;

  const DeliveryDetailScreen({Key? key, this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Order displayOrder = order ?? ModalRoute.of(context)!.settings.arguments as Order;

    return Scaffold(
      appBar: AppBar(
        title: Text('Pedido #${displayOrder.id}'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: const Color(0xFF2c2c2c),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Customer Info
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: const Color(0xFF2c2c2c)),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Detalle del Cliente', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text('Cliente: ${displayOrder.customerName}'),
                  Text('Dirección: ${displayOrder.customerAddress}'),
                  const Text('Tel: +54 9 11 1234 5678'), // Mocked
                ],
              ),
            ),
            const SizedBox(height: 24),
            
            // Products
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: const Color(0xFF2c2c2c)),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Productos', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  ...displayOrder.items.map((item) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${item.quantity}x ${item.product.name}'),
                        Text('\$${item.total.toStringAsFixed(2)}'),
                      ],
                    ),
                  )).toList(),
                  const Divider(thickness: 1, height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Total a Cobrar', style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('\$${displayOrder.total.toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  )
                ],
              ),
            ),
            
            const SizedBox(height: 32),
            const Text('Actualizar Estado', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF6B6B), // Primary
              ),
              onPressed: () {
                Provider.of<DataProvider>(context, listen: false).updateOrderStatus(displayOrder.id, OrderStatus.onTheWay);
                Navigator.pop(context);
              },
              child: const Text('📍 En Camino'),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFA8E6CF), // Success
                foregroundColor: const Color(0xFF2c2c2c),
              ),
              onPressed: () {
                 Provider.of<DataProvider>(context, listen: false).updateOrderStatus(displayOrder.id, OrderStatus.delivered);
                 Navigator.pop(context);
              },
              child: const Text('✅ Entregado'),
            ),
          ],
        ),
      ),
    );
  }
}
