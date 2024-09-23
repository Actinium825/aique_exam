import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:qube_project/state/app_state.dart';

/// Reusable loading page state for actions
abstract class LoadingAction extends ReduxAction<AppState> {
  LoadingAction({required this.actionKey});

  final String actionKey;

  @override
  void before() => dispatch(WaitAction.add(actionKey));

  @override
  void after() => dispatch(WaitAction.remove(actionKey));
}

/// Deliver the qube
/// Mocks a delay
/// Set the state's is successful if so
class DeliverAction extends LoadingAction {
  DeliverAction() : super(actionKey: waitKey);

  static const waitKey = 'deliver-action';

  @override
  Future<AppState> reduce() async {
    await Future<void>.delayed(const Duration(seconds: 3));
    return state.copyWith(isSuccessful: true);
  }
}

/// Reset the details, selected qube, and is successful event on Step 2
/// Gets called after leaving Step 2 Tab
class ResetDetailsAction extends ReduxAction<AppState> {
  @override
  AppState reduce() {
    // TODO: Add resetting of selected qube and details
    return state.copyWith(isSuccessful: null);
  }
}
