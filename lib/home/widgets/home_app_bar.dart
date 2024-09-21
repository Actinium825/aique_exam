import 'package:flutter/material.dart';
import 'package:qube_project/utils/const.dart';
import 'package:qube_project/utils/strings.dart';
import 'package:qube_project/utils/styles.dart';
import 'package:qube_project/widgets/gradient_text.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: homeAppBarPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
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
