import 'package:async_redux/async_redux.dart';
import 'package:qube_project/home/home_connector.dart';
import 'package:qube_project/state/action/actions.dart';
import 'package:qube_project/state/app_state.dart';

class HomeVmFactory extends VmFactory<AppState, HomeConnector, HomeVM> {
  @override
  HomeVM fromStore() => HomeVM(isGettingList: state.wait.isWaiting(GetInitialListAction.waitKey));
}

class HomeVM extends Vm {
  final bool isGettingList;

  HomeVM({required this.isGettingList}) : super(equals: [isGettingList]);
}
