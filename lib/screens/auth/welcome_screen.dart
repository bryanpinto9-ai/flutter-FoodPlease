import 'package:flutter/material.dart';
import '../../theme/sketchy_theme.dart';
import '../../widgets/sketchy_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 375, // Simulate phone width mostly for web/desktop look roughly
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              // Logo
              Transform.rotate(
                angle: -0.05, // -3 deg approx
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: SketchyTheme.highlightColor,
                    border: Border.all(color: SketchyTheme.textPrimary, width: 2),
                    boxShadow: const [
                       BoxShadow(
                        color: SketchyTheme.textPrimary,
                        offset: Offset(5, 5),
                        blurRadius: 0,
                      )
                    ],
                  ),
                  child: Text(
                    'FoodPlease+',
                    style: SketchyTheme.titleStyle.copyWith(fontSize: 40),
                  ),
                ),
              ),
              const Spacer(),
              Text(
                'Tu comida favorita, al instante.',
                style: SketchyTheme.textStyle.copyWith(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              SketchyButton(
                text: 'Iniciar sesión',
                isPrimary: true,
                width: double.infinity,
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
              ),
              const SizedBox(height: 10),
              SketchyButton(
                text: 'Registrarse',
                width: double.infinity,
                onPressed: () {
                  Navigator.pushNamed(context, '/register');
                },
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
