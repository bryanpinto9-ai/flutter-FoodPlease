import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../widgets/owner_bottom_nav.dart';
import '../widgets/delivery_bottom_nav.dart';
import '../models/user_model.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    final user = auth.currentUser;

    if (user == null) {
      return const Scaffold(body: Center(child: Text('No authenticated user')));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(user.role == UserRole.owner ? 'Ajustes' : 'Perfil'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        foregroundColor: const Color(0xFF2c2c2c),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: Color(0xFF4ECDC4),
              child: Icon(Icons.person, size: 50, color: Colors.white),
            ),
            const SizedBox(height: 24),
            Text(user.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text(user.email, style: const TextStyle(fontSize: 16, color: Colors.grey)),
            
            const SizedBox(height: 48),
            
            ListTile(
              leading: const Icon(Icons.security),
              title: const Text('Cambiar Contraseña'),
              onTap: () {},
            ),
             ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Notificaciones'),
              onTap: () {},
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                onPressed: () {
                  auth.logout();
                   Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
                },
                child: const Text('Cerrar Sesión'),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: user.role == UserRole.owner 
          ? const OwnerBottomNav(selectedIndex: 2)
          : const DeliveryBottomNav(selectedIndex: 1),
    );
  }
}
