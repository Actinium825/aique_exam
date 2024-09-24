import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:qube_project/database/database.dart';
import 'package:qube_project/qube_list/qube_list_connector.dart';
import 'package:qube_project/state/action/actions.dart';
import 'package:qube_project/state/app_state.dart';

class QubeListVmFactory extends VmFactory<AppState, QubeListConnector, QubeListVM> {
  @override
  QubeListVM fromStore() => QubeListVM(onSelectQube: _onSelectQube);

  void _onSelectQube(QubeItem selectedQube) => dispatch(SelectQubeAction(selectedQube: selectedQube));
}

class QubeListVM extends Vm {
  final ValueChanged<QubeItem> onSelectQube;

  QubeListVM({required this.onSelectQube});
}
