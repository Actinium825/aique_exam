import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:qube_project/qube_list/qube_list_page.dart';
import 'package:qube_project/qube_list/qube_list_vm.dart';
import 'package:qube_project/state/app_state.dart';

class QubeListConnector extends StatelessWidget {
  const QubeListConnector({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, QubeListVM>(
      vm: QubeListVmFactory.new,
      builder: (_, vm) => QubeListPage(
        onSelectQube: vm.onSelectQube,
        isPosting: vm.isPosting,
        isGettingList: vm.isGettingList,
      ),
    );
  }
}
