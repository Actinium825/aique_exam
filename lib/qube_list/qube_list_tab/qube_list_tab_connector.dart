import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:qube_project/qube_list/qube_list_tab/qube_list_tab.dart';
import 'package:qube_project/qube_list/qube_list_tab/qube_list_tab_vm.dart';
import 'package:qube_project/state/app_state.dart';

class QubeListTabConnector extends StatelessWidget {
  const QubeListTabConnector({
    required this.tabController,
    super.key,
  });

  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, QubeListTabVM>(
      vm: QubeListTabVmFactory.new,
      builder: (_, vm) => QubeListTab(
        tabController: tabController,
        isLoading: vm.isLoading,
      ),
    );
  }
}
