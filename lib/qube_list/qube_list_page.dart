import 'package:flutter/material.dart';
import 'package:qube_project/database/database.dart';
import 'package:qube_project/main.dart';
import 'package:qube_project/qube_list/widgets/qube_list_tab.dart';
import 'package:qube_project/utils/const.dart';
import 'package:qube_project/utils/strings.dart';

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
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(tabBarRadius);
    final tabIndex = _tabController.index;

    return Expanded(
      child: Column(
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
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [
                ListenableBuilder(
                  listenable: _tabController,
                  builder: (_, __) => QubeListTab(
                    label: step1Label,
                    countColor: Colors.black.withOpacity(tabIndex == 0 ? 1 : unselectedTabOpacity),
                  ),
                ),
                ListenableBuilder(
                  listenable: _tabController,
                  builder: (_, __) => Opacity(
                    opacity: tabIndex == 1 ? 1 : unselectedTabOpacity,
                    child: const QubeListTab(label: step2Label),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                StreamBuilder<List<QubeItem>>(
                  stream: appDatabase.allIQubeItems(),
                  builder: (_, snapshot) {
                    final allQubeItems = [...?snapshot.data];
                    return ListView.builder(
                      itemCount: allQubeItems.length,
                      itemBuilder: (_, index) {
                        final qubeItem = allQubeItems[index];
                        return Text(qubeItem.identification);
                      },
                    );
                  },
                ),
                const SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
