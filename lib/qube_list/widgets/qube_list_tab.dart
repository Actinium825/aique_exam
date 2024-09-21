import 'package:flutter/material.dart';
import 'package:qube_project/utils/const.dart';
import 'package:qube_project/utils/styles.dart';
import 'package:qube_project/widgets/spacings.dart';

class QubeListTab extends StatelessWidget {
  const QubeListTab({
    required this.label,
    this.countColor = Colors.black,
    super.key,
  });

  final String label;
  final Color countColor;

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
          Container(
            height: qubeCountSize,
            width: qubeCountSize,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: Text(
              // TODO: Update value
              '0',
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
