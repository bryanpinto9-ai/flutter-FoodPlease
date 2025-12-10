import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import 'providers/auth_provider.dart';
import 'providers/data_provider.dart';
import 'providers/cart_provider.dart';

import 'screens/welcome_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';

// Client Screens
import 'screens/client/client_home_screen.dart';
import 'screens/client/cart_screen.dart';
import 'screens/client/order_status_screen.dart';

// Owner Screens
import 'screens/owner/owner_dashboard_screen.dart';
import 'screens/owner/product_management_screen.dart';
import 'screens/owner/edit_product_screen.dart';

// Delivery Screens
import 'screens/delivery/delivery_home_screen.dart';
import 'screens/delivery/delivery_detail_screen.dart';
import 'screens/profile_screen.dart';



void main() {
  runApp(const FoodPleaseApp());
}

class FoodPleaseApp extends StatelessWidget {
  const FoodPleaseApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => DataProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MaterialApp(
        title: 'FoodPlease+',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xFFfffdf0), // Creamy paper
          primaryColor: const Color(0xFFFF6B6B),
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: const Color(0xFFFF6B6B),
            secondary: const Color(0xFF4ECDC4),
          ),
          textTheme: GoogleFonts.patrickHandTextTheme(
            Theme.of(context).textTheme,
          ).apply(
            bodyColor: const Color(0xFF2c2c2c),
            displayColor: const Color(0xFF2c2c2c),
          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFF6B6B),
              foregroundColor: Colors.white,
              textStyle: GoogleFonts.patrickHand(fontSize: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
                side: const BorderSide(color: Color(0xFF2c2c2c), width: 2),
              ),
              elevation: 0,
            ),
          ),
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Color(0xFF2c2c2c), width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Color(0xFF2c2c2c), width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Color(0xFF4ECDC4), width: 2),
            ),
          ),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const WelcomeScreen(),
          '/login': (context) => const LoginScreen(),
          '/register': (context) => const RegisterScreen(),
          
          // Client
          '/client-home': (context) => const ClientHomeScreen(),
          '/cart': (context) => const CartScreen(),
          '/order-status': (context) => const OrderStatusScreen(),
          
          // Owner
          '/owner-dashboard': (context) => const OwnerDashboardScreen(),
          '/owner-products': (context) => const ProductManagementScreen(),
          '/owner-edit-product': (context) => const EditProductScreen(),

          // Delivery
          '/delivery-home': (context) => const DeliveryHomeScreen(),
          '/delivery-detail': (context) => const DeliveryDetailScreen(),
          '/profile': (context) => const ProfileScreen(),
        },
      ),
    );
  }
}
