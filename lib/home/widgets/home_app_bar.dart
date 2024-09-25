import 'package:flutter/material.dart';
import 'package:qube_project/utils/const.dart';
import 'package:qube_project/utils/strings.dart';
import 'package:qube_project/utils/styles.dart';
import 'package:qube_project/widgets/gradient_text.dart';
import 'package:qube_project/widgets/loading_shimmer.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    required this.isGettingList,
    super.key,
  });

  final bool isGettingList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: homeAppBarPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (isGettingList)
            const LoadingShimmer(width: 94)
          else
            GradientText(
              linearGradient: titleGradient,
              label: appTitle,
              style: TextStyles.semiBold.copyWith(fontSize: 32.0),
            ),
          const CircleAvatar(
            backgroundColor: buttonColor,
            child: Icon(
              Icons.person_outline,
              color: Colors.white,
              size: profileIconSize,
            ),
          ),
        ],
      ),
    );
  }
}
