import 'package:flutter/material.dart';
import 'package:qube_project/database/database.dart';
import 'package:qube_project/qube_list/qube_list_tab/qube_list_tab_connector.dart';
import 'package:qube_project/qube_list/step_2/step_2_tab_connector.dart';
import 'package:qube_project/qube_list/widgets/qube_list.dart';
import 'package:qube_project/utils/const.dart';
import 'package:qube_project/widgets/spacings.dart';

class QubeListPage extends StatefulWidget {
  const QubeListPage({super.key});

  @override
  State<QubeListPage> createState() => _QubeListPageState();
}

class _QubeListPageState extends State<QubeListPage> with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  late final ValueNotifier<QubeItem?> _selectedQubeNotifier;

  @override
  void initState() {
    _tabController = TabController(length: tabBarCount, vsync: this);
    _selectedQubeNotifier = ValueNotifier(null);
    super.initState();
  }

  @override
  void dispose() {
    _selectedQubeNotifier.dispose();
    _tabController.dispose();
    super.dispose();
  }

  /// Switch to Step 2 Tab after pressing 'Go To Step 2' on a qube item
  /// Sets the provided [qubeItem] as the selected to show in Step 2
  void _onSelectQube(QubeItem qubeItem) {
    _tabController.animateTo(1);
    _selectedQubeNotifier.value = qubeItem;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          QubeListTabConnector(tabController: _tabController),
          const VerticalSpace(space: 32.0),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                QubeList(onSelectQube: _onSelectQube),
                Step2TabConnector(selectedQubeNotifier: _selectedQubeNotifier),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
