import 'package:flutter/material.dart';
import 'package:qube_project/utils/const.dart';
import 'package:qube_project/utils/styles.dart';
import 'package:qube_project/widgets/gradient_text.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    required this.label,
    this.onPress,
    super.key,
  });

  final String label;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(qubeCardButtonRadius)),
        backgroundColor: buttonColor,
        disabledBackgroundColor: buttonColor,
      ),
      child: Container(
        padding: qubeCardButtonPadding,
        alignment: Alignment.center,
        child: GradientText(
          linearGradient: onPress == null ? disabledTextGradient : qubeGradient,
          label: label,
          style: TextStyles.base,
        ),
      ),
    );
  }
}
