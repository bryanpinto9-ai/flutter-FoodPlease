import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import '../../widgets/owner_bottom_nav.dart';

class OwnerDashboardScreen extends StatelessWidget {
  const OwnerDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Panel Dueño'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: const Color(0xFF2c2c2c),
        automaticallyImplyLeading: false,
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
          children: [
            // Total Orders Card
            _buildStatCard('Total Pedidos', '145', const Color(0xFFFF6B6B)),
            const SizedBox(height: 16),
            Row(
              children: [
                 Expanded(child: _buildStatCard('Activos', '32', const Color(0xFF2c2c2c))),
                 const SizedBox(width: 16),
                 Expanded(child: _buildStatCard('Ventas Hoy', '\$1.2k', const Color(0xFF2c2c2c))),
              ],
            ),
            const SizedBox(height: 32),
            const Align(alignment: Alignment.centerLeft, child: Text('Accesos Rápidos', style: TextStyle(fontSize: 20))),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, 
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 24),
                    ),
                    onPressed: () => Navigator.pushNamed(context, '/owner-products'),
                    child: const Column(children: [Icon(Icons.inventory_2, size: 30), Text('Gestión Prod.')]),
                  ),
                ),
                const SizedBox(width: 16),
                 Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, 
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 24),
                    ),
                    onPressed: () => Navigator.pushNamed(context, '/owner-edit-product'), // For create (no args)
                    child: const Column(children: [Icon(Icons.add, size: 30), Text('Agregar Prod.')]),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: const OwnerBottomNav(selectedIndex: 0),
    );
  }

  Widget _buildStatCard(String title, String value, Color valueColor) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFF2c2c2c), width: 2),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [BoxShadow(color: Colors.black12, offset: Offset(4, 4))],
      ),
      child: Column(
        children: [
          Text(title, style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 8),
          Text(value, style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: valueColor)),
        ],
      ),
    );
  }
}
