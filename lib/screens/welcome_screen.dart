import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const Spacer(),
            // Logo
            Transform.rotate(
              angle: -3 * 3.14159 / 180, // -3 degrees
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFE66D), // Highlight color
                  border: Border.all(color: const Color(0xFF2c2c2c), width: 2),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0xFF2c2c2c),
                      offset: Offset(5, 5),
                    )
                  ],
                ),
                child: const Text(
                  'FoodPlease+',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              'Tu comida favorita, al instante.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/login'),
                child: const Text('Iniciar sesión'),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: const Color(0xFF2c2c2c), // Text primary
                ),
                onPressed: () => Navigator.pushNamed(context, '/register'),
                child: const Text('Registrarse'),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
