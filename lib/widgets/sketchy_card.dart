import 'package:flutter/material.dart';
import '../theme/sketchy_theme.dart';

class SketchyCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;

  const SketchyCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(15),
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Widget content = Container(
      width: double.infinity,
      padding: padding,
      decoration: SketchyTheme.containerDecoration,
      child: child,
    );

    if (onTap != null) {
      return GestureDetector(
        onTap: onTap,
        child: content,
      );
    }
    return content;
  }
}
