import 'package:flutter/material.dart';
import 'package:qube_project/qube_list/widgets/qube_list.dart';
import 'package:qube_project/qube_list/widgets/qube_list_tab.dart';
import 'package:qube_project/utils/const.dart';
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
    return Expanded(
      child: Column(
        children: [
          QubeListTab(tabController: _tabController),
          const VerticalSpace(space: 32.0),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                QubeList(onNavigateToStep2: _onNavigateToStep2),
                const SizedBox(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
