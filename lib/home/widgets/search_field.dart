import 'package:flutter/material.dart';
import 'package:qube_project/utils/const.dart';
import 'package:qube_project/utils/strings.dart';
import 'package:qube_project/utils/styles.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    required this.isGettingList,
    super.key,
  });

  final bool isGettingList;

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(borderRadius: BorderRadius.circular(searchBarRadius));
    return AnimatedOpacity(
      duration: kThemeChangeDuration,
      opacity: isGettingList ? disabledSearchOpacity : 1,
      child: SizedBox(
        height: searchBarHeight,
        child: TextField(
          decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.search,
              size: searchIconSize,
              color: Colors.white,
            ),
            enabled: !isGettingList,
            contentPadding: EdgeInsets.zero,
            alignLabelWithHint: false,
            floatingLabelBehavior: FloatingLabelBehavior.never,
            hintText: searchBarHintText,
            hintStyle: TextStyles.xxs,
            border: border.copyWith(borderSide: const BorderSide(color: Colors.white10)),
            focusedBorder: border.copyWith(borderSide: const BorderSide(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}
