import 'package:flutter/material.dart';
import 'package:qube_project/utils/const.dart';
import 'package:qube_project/utils/styles.dart';
import 'package:qube_project/widgets/gradient_point.dart';

class DetailsCard extends StatelessWidget {
  const DetailsCard({
    required this.hintText,
    super.key,
  });

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: detailsCardHeight,
      child: TextFormField(
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(detailsCardRadius),
            borderSide: BorderSide(
              width: detailsCardBorderWidth,
              color: Colors.white.withOpacity(0.3),
            ),
          ),
          prefixIcon: const Padding(
            padding: detailsCardPrefixPadding,
            child: GradientPoint(),
          ),
          prefixIconConstraints: const BoxConstraints(maxHeight: 20),
          hintText: hintText,
          contentPadding: EdgeInsets.zero,
          hintStyle: TextStyles.xxs,
        ),
      ),
    );
  }
}
