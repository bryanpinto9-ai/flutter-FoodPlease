import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/app_provider.dart';
import '../../theme/sketchy_theme.dart';
import '../../widgets/sketchy_button.dart';
import '../../widgets/sketchy_input.dart';
import '../../models/app_user.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController(text: 'cliente@test.com');
  final TextEditingController _passwordController = TextEditingController(text: '123456');

  void _handleLogin() {
     final provider = Provider.of<AppDataProvider>(context, listen: false);
     provider.login(_emailController.text);

     final user = provider.currentUser;
     
     if (user != null) {
       if (user.role == UserRole.owner) {
          // Navigator.pushReplacementNamed(context, '/owner-dashboard');
          print('Go to Owner Dashboard'); 
       } else if (user.role == UserRole.delivery) {
          // Navigator.pushReplacementNamed(context, '/delivery-home');
          print('Go to Delivery Home');
       } else {
          // Navigator.pushReplacementNamed(context, '/client-home');
          print('Go to Client Home');
       }
     }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text('← Volver', style: SketchyTheme.textStyle.copyWith(color: SketchyTheme.primaryColor)),
                  ),
                  const Spacer(),
                  Text('Login', style: SketchyTheme.titleStyle),
                  const Spacer(),
                  const SizedBox(width: 60), // Balance
                ],
              ),
              const Divider(color: SketchyTheme.textPrimary, thickness: 2, endIndent: 5, indent: 5), // Dashed line simulation
              const SizedBox(height: 20),
             
              SketchyInput(
                label: 'Correo electrónico',
                placeholder: 'usuario@example.com',
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 15),
              SketchyInput(
                label: 'Contraseña',
                placeholder: '••••••',
                obscureText: true,
                controller: _passwordController,
              ),
              
              const Spacer(),
              SketchyButton(
                text: 'Ingresar',
                isPrimary: true,
                width: double.infinity,
                onPressed: _handleLogin,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
