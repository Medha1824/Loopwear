import 'package:flutter/material.dart';

class URoundedContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final Color backgroundColor;
  final bool showBorder;

  const URoundedContainer({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(8),
    this.backgroundColor = Colors.white,
    this.showBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: showBorder ? Border.all(color: Colors.grey.shade300) : null,
      ),
      child: child,
    );
  }
}