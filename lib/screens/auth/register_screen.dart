import 'package:flutter/material.dart';
import '../../theme/sketchy_theme.dart';
import '../../widgets/sketchy_button.dart';
import '../../widgets/sketchy_input.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String _selectedRole = 'Cliente';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
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
                    Text('Registro', style: SketchyTheme.titleStyle),
                    const Spacer(),
                    const SizedBox(width: 60),
                  ],
                ),
                const Divider(color: SketchyTheme.textPrimary, thickness: 2),
                const SizedBox(height: 20),
                
                 const SketchyInput(label: 'Nombre completo', placeholder: 'Juan Pérez'),
                 const SizedBox(height: 15),
                 const SketchyInput(label: 'Correo electrónico', placeholder: 'email@example.com'),
                 const SizedBox(height: 15),
                 const SketchyInput(label: 'Contraseña', placeholder: '••••••', obscureText: true),
                 const SizedBox(height: 15),
                 
                 Text('Tipo de Usuario', style: SketchyTheme.textStyle.copyWith(fontSize: 18)),
                 const SizedBox(height: 5),
                 Container(
                   width: double.infinity,
                   padding: const EdgeInsets.symmetric(horizontal: 12),
                   decoration: SketchyTheme.inputDecoration,
                   child: DropdownButtonHideUnderline(
                     child: DropdownButton<String>(
                       value: _selectedRole,
                       style: SketchyTheme.textStyle,
                       items: ['Cliente', 'Dueño del Local', 'Repartidor'].map((String value) {
                         return DropdownMenuItem<String>(
                           value: value,
                           child: Text(value),
                         );
                       }).toList(),
                       onChanged: (newValue) {
                         setState(() {
                           _selectedRole = newValue!;
                         });
                       },
                     ),
                   ),
                 ),
            
                 const SizedBox(height: 30),
                 SketchyButton(
                  text: 'Registrarse',
                  isPrimary: true,
                  width: double.infinity,
                  onPressed: () {
                     Navigator.pushNamed(context, '/login');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
