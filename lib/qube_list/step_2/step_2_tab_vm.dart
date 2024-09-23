import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:qube_project/qube_list/step_2/step_2_tab_connector.dart';
import 'package:qube_project/state/action/actions.dart';
import 'package:qube_project/state/app_state.dart';

class Step2TabVmFactory extends VmFactory<AppState, Step2TabConnector, Step2TabVM> {
  @override
  Step2TabVM fromStore() {
    return Step2TabVM(
      isLoading: state.wait.isWaiting(DeliverAction.waitKey),
      onDeliver: _onDeliver,
    );
  }

  void _onDeliver() => dispatch(DeliverAction());
}

class Step2TabVM extends Vm {
  final bool isLoading;
  final VoidCallback onDeliver;

  Step2TabVM({
    required this.isLoading,
    required this.onDeliver,
  }) : super(equals: [isLoading]);
}
