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
  late final ValueNotifier<int> _tabIndexNotifier;

  @override
  void initState() {
    _tabController = TabController(length: tabBarCount, vsync: this)..addListener(_onUpdateTab);
    _tabIndexNotifier = ValueNotifier(0);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _tabIndexNotifier.dispose();
    super.dispose();
  }

  /// Update tab index for updating tab style
  void _onUpdateTab() => _tabIndexNotifier.value = _tabController.index;

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
                  builder: (_, snapshot) => ValueListenableBuilder<int>(
                    valueListenable: _tabIndexNotifier,
                    builder: (_, tabIndex, __) => QubeListTab(
                      label: step1Label,
                      countColor: Colors.black.withOpacity(tabIndex == 0 ? 1 : unselectedTabOpacity),
                      count: snapshot.data ?? 0,
                    ),
                  ),
                ),
                ValueListenableBuilder<int>(
                  valueListenable: _tabIndexNotifier,
                  builder: (_, tabIndex, __) {
                    final isSelected = tabIndex == 1;
                    return AnimatedOpacity(
                      duration: kThemeAnimationDuration,
                      opacity: isSelected ? 1 : unselectedTabOpacity,
                      child: QubeListTab(
                        label: step2Label,
                        count: isSelected ? 1 : 0,
                      ),
                    );
                  },
                ),
              ],
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
                      itemBuilder: (_, index) => QubeCard(qubeItem: allQubeItems[index]),
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
