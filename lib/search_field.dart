import 'package:flutter/material.dart';
import 'package:qube_project/utils/const.dart';
import 'package:qube_project/utils/strings.dart';
import 'package:qube_project/utils/styles.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: searchBarHeight,
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.search,
            size: searchIconSize,
            color: Colors.white,
          ),
          contentPadding: EdgeInsets.zero,
          alignLabelWithHint: false,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          labelText: searchBarHintText,
          labelStyle: TextStyles.xxs,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(searchBarRadius),
            borderSide: const BorderSide(color: Colors.white10),
          ),
        ),
      ),
    );
  }
}
