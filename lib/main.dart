import 'package:flutter/material.dart';
import 'package:qube_project/qube_list/qube_list_page.dart';
import 'package:qube_project/utils/const.dart';
import 'package:qube_project/utils/strings.dart';
import 'package:qube_project/utils/styles.dart';
import 'package:qube_project/widgets/spacings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: scaffoldBackgroundColor,
          body: Column(
            children: [
              Container(
                height: searchBarHeight,
                margin: searchBarMargin,
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
                    labelStyle: TextStyles.xxs.copyWith(color: Colors.white.withOpacity(0.5)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(searchBarRadius),
                      borderSide: const BorderSide(color: Colors.white10),
                    ),
                  ),
                ),
              ),
              const VerticalSpace(space: 12.0),
              const QubeListPage(),
            ],
          ),
        ),
      ),
    );
  }
}
