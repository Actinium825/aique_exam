import 'package:flutter/material.dart';

class GradientText extends StatelessWidget {
  const GradientText({
    required this.linearGradient,
    required this.label,
    required this.style,
    super.key,
  });

  final LinearGradient linearGradient;
  final String label;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => linearGradient.createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
      child: Text(
        label,
        style: style,
      ),
    );
  }
}
