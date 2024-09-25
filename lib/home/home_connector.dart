import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:qube_project/home/home.dart';
import 'package:qube_project/home/home_vm.dart';
import 'package:qube_project/state/action/actions.dart';
import 'package:qube_project/state/app_state.dart';

class HomeConnector extends StatelessWidget {
  const HomeConnector({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, HomeVM>(
      vm: HomeVmFactory.new,
      onInit: (store) => store.dispatch(GetInitialListAction()),
      builder: (_, vm) => Home(isGettingList: vm.isGettingList),
    );
  }
}
