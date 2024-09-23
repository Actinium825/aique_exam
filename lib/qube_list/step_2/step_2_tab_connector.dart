import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:qube_project/database/database.dart';
import 'package:qube_project/qube_list/step_2/step_2_tab.dart';
import 'package:qube_project/qube_list/step_2/step_2_tab_vm.dart';
import 'package:qube_project/state/app_state.dart';

class Step2TabConnector extends StatelessWidget {
  const Step2TabConnector({
    required this.selectedQubeNotifier,
    super.key,
  });

  // TODO: Move to state instead
  final ValueNotifier<QubeItem?> selectedQubeNotifier;

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Step2TabVM>(
      vm: Step2TabVmFactory.new,
      builder: (_, vm) => Step2Tab(
        selectedQubeNotifier: selectedQubeNotifier,
        isLoading: vm.isLoading,
        onDeliver: vm.onDeliver,
      ),
    );
  }
}
