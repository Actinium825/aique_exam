import 'package:flutter/material.dart';
import 'package:qube_project/database/database.dart';
import 'package:qube_project/utils/const.dart';
import 'package:qube_project/utils/strings.dart';
import 'package:qube_project/utils/styles.dart';
import 'package:qube_project/widgets/gradient_text.dart';
import 'package:qube_project/widgets/spacings.dart';

class QubeCard extends StatelessWidget {
  const QubeCard({
    required this.qubeItem,
    required this.onPress,
    super.key,
  });

  final VoidCallback onPress;
  final QubeItem qubeItem;

  @override
  Widget build(BuildContext context) {
    const verticalSpace = VerticalSpace(space: 4.0);
    const horizontalSpace = HorizontalSpace(space: 8.0);

    return Container(
      padding: qubeCardPadding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(qubeCardRadius),
        color: qubeCardBackgroundColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            qubeItem.time,
            style: TextStyles.xxs,
          ),
          verticalSpace,
          Text(
            qubeItem.identification,
            style: TextStyles.base,
          ),
          verticalSpace,
          Row(
            children: [
              Text(
                qubeItem.location,
                style: TextStyles.xxs,
              ),
              horizontalSpace,
              const Icon(
                Icons.arrow_right_alt,
                color: Colors.white,
                size: qubeCardArrowSize,
              ),
              horizontalSpace,
              Text(
                qubeItem.receiver,
                style: TextStyles.xxs,
              ),
            ],
          ),
          const VerticalSpace(space: 20.0),
          ElevatedButton(
            onPressed: onPress,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(qubeCardButtonRadius)),
              backgroundColor: buttonColor,
            ),
            child: Container(
              padding: qubeCardButtonPadding,
              alignment: Alignment.center,
              child: GradientText(
                linearGradient: qubeGradient,
                label: qubeCardButtonLabel,
                style: TextStyles.base,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
