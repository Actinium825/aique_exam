import 'package:flutter/material.dart';
import 'package:qube_project/utils/const.dart';
import 'package:qube_project/utils/styles.dart';
import 'package:qube_project/widgets/spacings.dart';

class QubeListTab extends StatelessWidget {
  const QubeListTab({
    required this.label,
    super.key,
  });

  final String label;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label),
          const HorizontalSpace(space: 8.0),
          Container(
            height: qubeCountSize,
            width: qubeCountSize,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              // TODO: Update color if unselected
              color: Colors.white,
            ),
            child: Text(
              // TODO: Update value
              '0',
              // TODO: Update color if unselected
              style: TextStyles.base.copyWith(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
