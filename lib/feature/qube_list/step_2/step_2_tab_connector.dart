import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:qube_project/feature/qube_list/step_2/step_2_tab.dart';
import 'package:qube_project/feature/qube_list/step_2/step_2_tab_vm.dart';
import 'package:qube_project/state/action/actions.dart';
import 'package:qube_project/state/app_state.dart';

class Step2TabConnector extends StatelessWidget {
  const Step2TabConnector({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, Step2TabVM>(
      vm: Step2TabVmFactory.new,
      onDispose: (store) => store.dispatch(ResetDetailsAction()),
      builder: (_, vm) => Step2Tab(
        isLoading: vm.isLoading,
        onDeliver: vm.onDeliver,
        isSuccessful: vm.isSuccessful,
        selectedQube: vm.selectedQube,
        onUpdateForm: vm.onUpdateForm,
        qubeDetails: vm.qubeDetails,
      ),
    );
  }
}
