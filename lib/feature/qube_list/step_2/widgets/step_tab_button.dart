import 'package:flutter/material.dart';
import 'package:qube_project/utils/const.dart';
import 'package:qube_project/utils/styles.dart';
import 'package:qube_project/widgets/spacings.dart';

class StepTabButton extends StatelessWidget {
  const StepTabButton({
    required this.label,
    required this.count,
    this.countColor = Colors.black,
    super.key,
  });

  final String label;
  final Color countColor;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: TextStyles.base,
          ),
          const HorizontalSpace(space: 8.0),
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: qubeCountRadius,
            child: Text(
              count.toString(),
              style: TextStyles.semiBold.copyWith(
                color: countColor,
                fontSize: 13.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
