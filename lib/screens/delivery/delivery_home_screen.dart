import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/data_provider.dart';
import '../../providers/auth_provider.dart';
import '../../widgets/delivery_bottom_nav.dart';
import 'delivery_detail_screen.dart'; // Ensure import

class DeliveryHomeScreen extends StatelessWidget {
  const DeliveryHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<DataProvider>(context).orders;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Hola, Repartidor'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        foregroundColor: const Color(0xFF2c2c2c),
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Pedidos Asignados', style: TextStyle(fontSize: 24)),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: const Color(0xFF2c2c2c)),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [BoxShadow(color: Colors.black12, offset: Offset(4, 4))],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('#${order.id} - ${order.customerName}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                          Text(
                            order.statusText, 
                            style: TextStyle(
                              color: order.statusText == 'En Camino' ? const Color(0xFFFF6B6B) : const Color(0xFFF59E0B),
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text('📍 ${order.customerAddress}', style: const TextStyle(fontSize: 14)),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context, 
                              MaterialPageRoute(builder: (_) => DeliveryDetailScreen(order: order)),
                            );
                          },
                          child: const Text('Ver Detalles'),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: const DeliveryBottomNav(selectedIndex: 0),
    );
  }
}
