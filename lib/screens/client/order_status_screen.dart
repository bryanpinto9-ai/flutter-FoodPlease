import 'package:flutter/material.dart';
import '../../widgets/client_bottom_nav.dart';
import '../../models/order_model.dart'; // Ensure OrderStatus is available

class OrderStatusScreen extends StatelessWidget {
  const OrderStatusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // For prototype, just show static status or fetch latest from provider if implemented.
    // Let's assume static "En Camino" for now to match wireframe visual, or better:
    // Fetch latest order from DataProvider? We didn't link 'my orders' specifically to user yet.
    // We'll simulate a static view like the wireframe.
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pedido #1234'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false, 
        foregroundColor: const Color(0xFF2c2c2c),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const Center(
              child: Column(
                children: [
                  Text('¡Gracias por tu compra!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  Text('Tu pedido está en proceso.', style: TextStyle(fontSize: 16, color: Colors.grey)),
                ],
              ),
            ),
            const SizedBox(height: 40),
            
            // Timeline
            _buildTimelineItem('Pedido Recibido', true, true),
            _buildTimelineItem('En Preparación', true, true),
            _buildTimelineItem('En Camino', false, true), // Active but not done? Or just next step. Wireframe had it incomplete.
            _buildTimelineItem('Entregado', false, false),
          ],
        ),
      ),
      bottomNavigationBar: const ClientBottomNav(selectedIndex: 2),
    );
  }
  
  Widget _buildTimelineItem(String title, bool isActive, bool isNext) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
             Container(
               width: 20,
               height: 20,
               decoration: BoxDecoration(
                 color: isActive ? const Color(0xFF4ECDC4) : Colors.white,
                 border: Border.all(color: const Color(0xFF2c2c2c), width: 2),
                 shape: BoxShape.circle,
               ),
             ),
             if (isNext) // Don't show line for last item
               Container(
                 width: 2, 
                 height: 40, 
                 color: Colors.grey[300], 
                 margin: const EdgeInsets.symmetric(vertical: 4),
               ),
          ],
        ),
        const SizedBox(width: 16),
        Text(title, style: TextStyle(
          fontSize: 18, 
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          color: isActive ? Colors.black : Colors.grey,
        )),
      ],
    );
  }
}
