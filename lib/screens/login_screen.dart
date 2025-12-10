import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import '../../models/user_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController(text: 'cliente@test.com');
  final _passwordController = TextEditingController(text: '123456');

  void _handleLogin() {
    final email = _emailController.text;
    final password = _passwordController.text;

    if (email.isEmpty || password.isEmpty) return;

    Provider.of<AuthProvider>(context, listen: false).login(email, password);

    // Navigate based on role (mocked logic in provider sets role)
    final user = Provider.of<AuthProvider>(context, listen: false).currentUser;
    if (user != null) {
      switch (user.role) {
        case UserRole.client:
          Navigator.pushReplacementNamed(context, '/client-home');
          break;
        case UserRole.owner:
          Navigator.pushReplacementNamed(context, '/owner-dashboard');
          break;
        case UserRole.delivery:
           Navigator.pushReplacementNamed(context, '/delivery-home');
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF2c2c2c)),
        title: const Text('Login', style: TextStyle(color: Color(0xFF2c2c2c))),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Correo electrónico'),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _handleLogin,
                child: const Text('Ingresar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
