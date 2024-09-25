import 'package:flutter/material.dart';
import 'package:qube_project/home/widgets/home_app_bar.dart';
import 'package:qube_project/qube_list/qube_list_connector.dart';
import 'package:qube_project/home/widgets/search_field.dart';
import 'package:qube_project/utils/const.dart';
import 'package:qube_project/widgets/spacings.dart';

class Home extends StatelessWidget {
  const Home({
    required this.isGettingList,
    super.key,
  });

  final bool isGettingList;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: scaffoldBackgroundColor,
          body: Padding(
            padding: homePageMargin,
            child: Column(
              children: [
                const VerticalSpace(space: 32.0),
                HomeAppBar(isGettingList: isGettingList),
                const VerticalSpace(space: 20.0),
                const SearchField(),
                const VerticalSpace(space: 12.0),
                const QubeListConnector(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
