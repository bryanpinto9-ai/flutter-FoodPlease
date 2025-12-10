import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SketchyTheme {
// Colors
  static const Color bgColor = Color(0xFFFFFDF0); // Creamy paper
  static const Color textPrimary = Color(0xFF2C2C2C); // Pencil lead
  static const Color textSecondary = Color(0xFF555555);
  static const Color primaryColor = Color(0xFFFF6B6B); // Vibrant Red
  static const Color primaryHover = Color(0xFFEE5253);
  static const Color accentColor = Color(0xFF4ECDC4); // Teal
  static const Color highlightColor = Color(0xFFFFE66D); // Yellow
  static const Color successColor = Color(0xFFA8E6CF); // Mint
  static const Color navBg = Color(0xFF222222); // Marker Black
  static const Color borderColor = Color(0xFF2C2C2C);

  // Border Styles
  static BoxDecoration get containerDecoration {
    return BoxDecoration(
      color: Colors.white,
      border: Border.all(color: borderColor, width: 2),
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(255),
        topRight: Radius.circular(15),
        bottomRight: Radius.circular(225),
        bottomLeft: Radius.circular(15),
      ),
      boxShadow: const [
        BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.1),
          offset: Offset(4, 4),
          blurRadius: 0,
        ),
      ],
    );
  }

  static BoxDecoration get inputDecoration {
    return BoxDecoration(
      color: Colors.white,
      border: Border.all(color: borderColor, width: 2),
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(255),
        topRight: Radius.circular(15),
        bottomRight: Radius.circular(225),
        bottomLeft: Radius.circular(15),
      ),
    );
  }

   static ButtonStyle get primaryButtonStyle {
    return ElevatedButton.styleFrom(
      backgroundColor: primaryColor,
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      textStyle: GoogleFonts.patrickHand(fontSize: 20, fontWeight: FontWeight.bold),
      side: const BorderSide(color: borderColor, width: 2),
      elevation: 0,
      shadowColor: Colors.transparent, // Disable default shadow
    ).copyWith(
       // Custom shadow/offset implementation might be needed via Container wrapping or custom painter,
       // but for standard button we can try shape.
       shape: MaterialStateProperty.all(
          const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(255),
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(225),
                bottomLeft: Radius.circular(15),
              )
          ),
       ),
    );
  }

  static TextStyle get textStyle {
    return GoogleFonts.patrickHand(
      color: textPrimary,
      fontSize: 18,
    );
  }
  
  static TextStyle get titleStyle {
      return GoogleFonts.patrickHand(
          color: textPrimary,
          fontSize: 24,
          fontWeight: FontWeight.bold,
      );
  }
}
