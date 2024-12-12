import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Divider(color: Colors.white.withValues(alpha: 0.1)),
    );
  }
}
