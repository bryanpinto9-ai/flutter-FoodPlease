import 'package:flutter/material.dart';
import '../theme/sketchy_theme.dart';

class SketchyInput extends StatelessWidget {
  final String label;
  final String? placeholder;
  final bool obscureText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final int maxLines;

  const SketchyInput({
    super.key,
    required this.label,
    this.placeholder,
    this.obscureText = false,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: SketchyTheme.textStyle.copyWith(fontSize: 18)),
        const SizedBox(height: 5),
        Container(
          decoration: SketchyTheme.inputDecoration,
          child: TextField(
            controller: controller,
            obscureText: obscureText,
            keyboardType: keyboardType,
            maxLines: maxLines,
            style: SketchyTheme.textStyle.copyWith(fontSize: 18),
            decoration: InputDecoration(
              hintText: placeholder,
              hintStyle: SketchyTheme.textStyle.copyWith(color: Colors.grey),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
          ),
        ),
      ],
    );
  }
}
