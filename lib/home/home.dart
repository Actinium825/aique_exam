import 'package:flutter/material.dart';
import 'package:qube_project/home/widgets/home_app_bar.dart';
import 'package:qube_project/qube_list/qube_list_page.dart';
import 'package:qube_project/home/widgets/search_field.dart';
import 'package:qube_project/utils/const.dart';
import 'package:qube_project/widgets/spacings.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: scaffoldBackgroundColor,
          body: Padding(
            padding: homePageMargin,
            child: Column(
              children: [
                VerticalSpace(space: 32.0),
                HomeAppBar(),
                VerticalSpace(space: 20.0),
                SearchField(),
                VerticalSpace(space: 12.0),
                QubeListPage(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
