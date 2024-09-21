import 'package:flutter/material.dart';
import 'package:qube_project/database/database.dart';
import 'package:qube_project/main.dart';
import 'package:qube_project/qube_list/widgets/qube_card.dart';
import 'package:qube_project/qube_list/widgets/qube_list_tab.dart';
import 'package:qube_project/utils/const.dart';
import 'package:qube_project/utils/strings.dart';
import 'package:qube_project/widgets/spacings.dart';

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

  /// Switch to Step 2 Tab after pressing 'Go To Step 2' on a qube item
  void _onNavigateToStep2() => _tabController.animateTo(1);

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(tabBarRadius);
    return Expanded(
      child: Column(
        children: [
          Container(
            height: tabBarHeight,
            padding: tabBarPadding,
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: borderRadius,
            ),
            child: ListenableBuilder(
              listenable: _tabController,
              builder: (_, __) {
                final isStep1 = _tabController.index == 0;
                return AbsorbPointer(
                  absorbing: isStep1,
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
                      StreamBuilder<int>(
                        stream: appDatabase.qubeItemsCount(),
                        builder: (_, snapshot) => QubeListTab(
                          label: step1Label,
                          countColor: Colors.black.withOpacity(isStep1 ? 1 : unselectedTabOpacity),
                          count: snapshot.data ?? 0,
                        ),
                      ),
                      AnimatedOpacity(
                        duration: kThemeAnimationDuration,
                        opacity: !isStep1 ? 1 : unselectedTabOpacity,
                        child: QubeListTab(
                          label: step2Label,
                          count: !isStep1 ? 1 : 0,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const VerticalSpace(space: 32.0),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                StreamBuilder<List<QubeItem>>(
                  stream: appDatabase.allIQubeItems(),
                  builder: (_, snapshot) {
                    final allQubeItems = [...?snapshot.data];
                    return ListView.separated(
                      itemCount: allQubeItems.length,
                      itemBuilder: (_, index) => QubeCard(
                        qubeItem: allQubeItems[index],
                        onPress: _onNavigateToStep2,
                      ),
                      separatorBuilder: (_, __) => const VerticalSpace(space: 20.0),
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
