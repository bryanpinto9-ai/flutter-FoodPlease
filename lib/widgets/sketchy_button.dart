import 'package:flutter/material.dart';
import '../theme/sketchy_theme.dart';

class SketchyButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isPrimary;
  final double? width;

  const SketchyButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isPrimary = false,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width, // Can be null (auto width) or double.infinity (full width)
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isPrimary ? SketchyTheme.primaryColor : Colors.white,
          foregroundColor: isPrimary ? Colors.white : SketchyTheme.textPrimary,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          textStyle: SketchyTheme.titleStyle.copyWith(fontSize: 20),
          side: const BorderSide(color: SketchyTheme.borderColor, width: 2),
           shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(255),
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(225),
                bottomLeft: Radius.circular(15),
              )
          ),
          elevation: 0,
        ),
        child: Text(text),
      ),
    );
  }
}
