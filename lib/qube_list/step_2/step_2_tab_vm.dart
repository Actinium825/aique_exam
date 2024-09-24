import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:qube_project/database/database.dart';
import 'package:qube_project/qube_list/step_2/step_2_tab_connector.dart';
import 'package:qube_project/state/action/actions.dart';
import 'package:qube_project/state/app_state.dart';

class Step2TabVmFactory extends VmFactory<AppState, Step2TabConnector, Step2TabVM> {
  @override
  Step2TabVM fromStore() => Step2TabVM(
        isLoading: state.wait.isWaiting(DeliverAction.waitKey),
        onDeliver: _onDeliver,
        isSuccessful: state.isSuccessful,
        selectedQube: state.selectedQube,
      );

  void _onDeliver() => dispatch(DeliverAction());
}

class Step2TabVM extends Vm {
  final bool isLoading;
  final VoidCallback onDeliver;
  final bool? isSuccessful;
  final QubeItem? selectedQube;

  Step2TabVM({
    required this.selectedQube,
    required this.isLoading,
    required this.onDeliver,
    required this.isSuccessful,
  }) : super(
          equals: [
            selectedQube,
            isLoading,
            isSuccessful,
          ],
        );
}
