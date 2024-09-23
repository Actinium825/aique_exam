import 'package:async_redux/async_redux.dart';
import 'package:qube_project/qube_list/qube_list_tab/qube_list_tab_connector.dart';
import 'package:qube_project/state/action/actions.dart';
import 'package:qube_project/state/app_state.dart';

class QubeListTabVmFactory extends VmFactory<AppState, QubeListTabConnector, QubeListTabVM> {
  @override
  QubeListTabVM fromStore() {
    return QubeListTabVM(isLoading: state.wait.isWaiting(DeliverAction.waitKey));
  }
}

class QubeListTabVM extends Vm {
  final bool isLoading;

  QubeListTabVM({required this.isLoading}) : super(equals: [isLoading]);
}
