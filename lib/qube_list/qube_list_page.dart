import 'package:flutter/material.dart';
import 'package:qube_project/qube_list/widgets/qube_list_tab.dart';
import 'package:qube_project/utils/const.dart';
import 'package:qube_project/utils/strings.dart';
import 'package:qube_project/utils/styles.dart';

class QubeListPage extends StatefulWidget {
  const QubeListPage({super.key});

  @override
  State<QubeListPage> createState() => _QubeListPageState();
}

class _QubeListPageState extends State<QubeListPage> with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: tabBarCount, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(tabBarRadius);
    return Column(
      children: [
        Container(
          height: tabBarHeight,
          margin: searchBarMargin,
          padding: tabBarPadding,
          decoration: BoxDecoration(
            color: tabBarBackgroundColor,
            borderRadius: borderRadius,
          ),
          child: TabBar(
            splashBorderRadius: borderRadius,
            controller: _tabController,
            dividerColor: Colors.transparent,
            indicator: BoxDecoration(
              borderRadius: borderRadius,
              gradient: selectedTabGradient,
            ),
            labelStyle: TextStyles.base,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: const [
              QubeListTab(label: step1Label),
              QubeListTab(label: step2Label),
            ],
          ),
        ),
      ],
    );
  }
}
